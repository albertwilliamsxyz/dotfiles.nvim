-- Tailwind-style at-rules are not errors
return {
	settings = {
		css = { lint = { unknownAtRules = "ignore" } },
	},
}
