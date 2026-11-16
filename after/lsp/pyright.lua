return {
	before_init = function(_, config)
		local python = config.root_dir and (config.root_dir .. "/.venv/bin/python")
		if python and vim.uv.fs_stat(python) then
			config.settings.python.pythonPath = python
		end
	end,
}
