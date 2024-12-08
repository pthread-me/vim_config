require("autoclose").setup({
	keys = {
		["("] = { escape = false, close = true, pair = "()" },
		["["] = { escape = false, close = true, pair = "[]" },
		["{"] = { escape = false, close = true, pair = "{}" },
		[">"] = { escape = true, close = false, pair = "<>" },
		[")"] = { escape = true, close = false, pair = "()" },
		["]"] = { escape = true, close = false, pair = "[]" },
		["}"] = { escape = true, close = false, pair = "{}" },
		['"'] = { escape = true, close = true, pair = '""' },
--		["$"] = {escape = false, close = true, pair = "$$", disable_filetypes = {"all"}, enable_filetypes = {"latex"}},

		-- Do nothing 
		["'"] = { escape = false, close = false, pair = "'" },
		["`"] = { escape = false, close = false, pair = "``" },

	},

	options = {
		auto_indent = false,
		disable_command_mode =true
	}
})
