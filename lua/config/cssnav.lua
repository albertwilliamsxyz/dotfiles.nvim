-- Jump to CSS Modules class definitions: `composes` in all three of its forms,
-- and `styles.foo` in TS/TSX.
--
-- No language server covers this. cssls declares interFileDependencies=false
-- and has no workspace symbols, so it cannot see past the open buffer; the
-- CSS-Modules-aware servers only attach to JS/TS buffers or skip `composes
-- ... from global` by design and never index plain .css files. The grammar is
-- frozen, so an AST query plus path resolution is the durable answer.

local M = {}

local PRUNE = { ["node_modules"] = true, [".git"] = true, dist = true, build = true }

local function text(node, source)
	return vim.treesitter.get_node_text(node, source)
end

--- Every `.class` rule in a CSS file, located via treesitter.
local function definitions_in(path, class)
	local fd = io.open(path, "r")
	if not fd then
		return {}
	end
	local content = fd:read("*a")
	fd:close()

	local ok, parser = pcall(vim.treesitter.get_string_parser, content, "css")
	if not ok then
		return {}
	end
	local query = vim.treesitter.query.parse("css", "(class_selector (class_name) @name)")
	local found = {}
	for _, node in query:iter_captures(parser:parse()[1]:root(), content) do
		if text(node, content) == class then
			found[#found + 1] = { filename = path, line = node:start() + 1 }
		end
	end
	return found
end

--- Files under root matching `predicate`, skipping vendor/build trees.
local function scan(root, predicate)
	local files = {}
	for name, kind in vim.fs.dir(root, {
		depth = 12,
		skip = function(dir)
			return not PRUNE[dir]
		end,
	}) do
		if kind == "file" and predicate(vim.fs.basename(name)) then
			files[#files + 1] = vim.fs.joinpath(root, name)
		end
	end
	return files
end

--- Cursor inside a `composes:` declaration → the class and where it lives.
local function composes_target()
	local node = vim.treesitter.get_node()
	while node and node:type() ~= "plain_value" do
		node = node:parent()
	end
	if not node then
		return nil
	end

	local decl = node:parent()
	if not decl or decl:type() ~= "declaration" then
		return nil
	end
	local property = decl:named_child(0)
	if not property or text(property, 0) ~= "composes" then
		return nil
	end

	local class = text(node, 0)
	if class == "from" or class == "global" then
		return nil
	end

	local target = { class = class }
	for child in decl:iter_children() do
		if child:type() == "string_value" then
			local content = child:named_child(0)
			target.spec = content and text(content, 0) or nil
		elseif child:type() == "plain_value" and text(child, 0) == "global" then
			target.global = true
		end
	end
	return target
end

--- Cursor on `styles.foo` or `styles['foo']` → the class and its module.
local function styles_target(buf)
	local node = vim.treesitter.get_node()
	if not node then
		return nil
	end

	local object, class
	if node:type() == "property_identifier" then
		local parent = node:parent()
		if parent and parent:type() == "member_expression" then
			object, class = parent:field("object")[1], node
		end
	elseif node:type() == "string_fragment" then
		local subscript = node:parent() and node:parent():parent()
		if subscript and subscript:type() == "subscript_expression" then
			object, class = subscript:field("object")[1], node
		end
	end
	if not (object and class and object:type() == "identifier") then
		return nil
	end

	-- Find the import that bound this identifier
	local name = text(object, buf)
	local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype) or "typescript"
	local ok, parser = pcall(vim.treesitter.get_parser, buf, lang)
	if not ok or not parser then
		return nil
	end
	local query = vim.treesitter.query.parse(
		lang,
		[[(import_statement
			(import_clause (identifier) @ident)
			source: (string (string_fragment) @path))]]
	)

	local bound
	for id, node_ in query:iter_captures(parser:parse()[1]:root(), buf) do
		local capture = query.captures[id]
		if capture == "ident" then
			bound = text(node_, buf)
		elseif capture == "path" and bound == name then
			return { class = text(class, buf), spec = text(node_, buf) }
		end
	end
	return nil
end

--- Turn a target into concrete locations.
local function locate(target, buf)
	local current = vim.api.nvim_buf_get_name(buf)
	local root = vim.fs.root(buf, { "package.json", ".git" }) or vim.fn.getcwd()
	local files

	if target.spec then
		if target.spec:match("^%.%.?/") then
			files = { vim.fs.normalize(vim.fs.joinpath(vim.fs.dirname(current), target.spec)) }
		else
			-- Alias or bare specifier. Matching by file name beats resolving the
			-- alias table: it needs no tsconfig/vite parsing and survives
			-- solution-style tsconfigs that carry no paths at all.
			local wanted = vim.fs.basename(target.spec)
			files = scan(root, function(name)
				return name == wanted
			end)
		end
	elseif target.global then
		-- `from global` names a class in a plain, non-module stylesheet
		files = scan(root, function(name)
			return name:match("%.css$") ~= nil and name:match("%.module%.css$") == nil
		end)
	else
		files = { current }
	end

	local found = {}
	for _, file in ipairs(files) do
		vim.list_extend(found, definitions_in(file, target.class))
	end
	return found
end

--- 'tagfunc': answer for CSS classes, otherwise hand back to the LSP.
function M.tagfunc(pattern, flags, info)
	local buf = vim.api.nvim_get_current_buf()
	local css = vim.tbl_contains({ "css", "scss", "less" }, vim.bo[buf].filetype)
	local ok, target = pcall(css and composes_target or styles_target, buf)

	if ok and target then
		local found = locate(target, buf)
		if #found > 0 then
			return vim.tbl_map(function(item)
				return {
					name = target.class,
					filename = item.filename,
					cmd = tostring(item.line),
					kind = "c",
				}
			end, found)
		end
	end

	if next(vim.lsp.get_clients({ bufnr = buf })) then
		local lsp_ok, tags = pcall(vim.lsp.tagfunc, pattern, flags, info)
		if lsp_ok then
			return tags
		end
	end
	return vim.NIL
end

local group = vim.api.nvim_create_augroup("config.cssnav", { clear = true })
local FILETYPES = {
	"css",
	"scss",
	"less",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
}

-- Set on attach too: that is when Nvim points 'tagfunc' at the LSP, and ours
-- has to win to get a chance at the CSS classes it cannot resolve.
vim.api.nvim_create_autocmd({ "FileType", "LspAttach" }, {
	group = group,
	callback = function(ev)
		if vim.tbl_contains(FILETYPES, vim.bo[ev.buf].filetype) then
			vim.bo[ev.buf].tagfunc = "v:lua.require'config.cssnav'.tagfunc"
		end
	end,
})

return M
