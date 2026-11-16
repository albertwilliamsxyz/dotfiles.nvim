local function without_nulls(value)
	if value == vim.NIL then
		return nil
	end
	if type(value) == "table" then
		for key, item in pairs(value) do
			value[key] = without_nulls(item)
		end
	end
	return value
end

return {
	-- The default, "spago build --purs-args --json-errors", is spago 0.20's;
	-- spago 1.0 refuses it and wants --json-errors as its own flag.
	settings = { purescript = { buildCommand = "spago build --json-errors" } },
	-- spago.lock lives only at the workspace root, where output/ is; the
	-- default finds the nearest spago.yaml, which is a package folder.
	root_markers = { "spago.lock", "spago.yaml", "bower.json", "flake.nix", "psc-package.json", "shell.nix", "spago.dhall" },
	-- Imports from code actions arrive as a server request with
	-- documentChanges = null, which on_init's cleanup never sees.
	handlers = {
		["workspace/applyEdit"] = function(err, params, ctx)
			return vim.lsp.handlers["workspace/applyEdit"](err, without_nulls(params), ctx)
		end,
	},
	-- The server sends null for absent fields (textEdit, edit,
	-- additionalTextEdits); nvim 0.12.4 reads vim.NIL as present and crashes,
	-- so drop every null before nvim sees the answer.
	on_init = function(client)
		local request = client.request
		client.request = function(self, method, params, handler, bufnr)
			if not handler then
				return request(self, method, params, handler, bufnr)
			end
			return request(self, method, params, function(err, result, ...)
				return handler(err, without_nulls(result), ...)
			end, bufnr)
		end
	end,
}
