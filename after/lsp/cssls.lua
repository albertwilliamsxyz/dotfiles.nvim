-- CSS Modules' `composes` is not standard CSS, so the server flags it as an
-- unknown property. validProperties whitelists just that one identifier and
-- leaves unknown-property detection armed for real typos.
-- validate must stay in the same table: a partial lint branch makes the server
-- throw on a null validProperties (nvim-lspconfig#3393).
local settings = {
	validate = true,
	lint = {
		validProperties = { "composes" },
		unknownAtRules = "ignore", -- Tailwind-style at-rules
	},
}

return {
	settings = {
		css = settings,
		scss = settings,
		less = settings,
	},
}
