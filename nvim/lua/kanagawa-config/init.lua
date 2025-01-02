-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        local theme = colors.theme
		
		local makeDiagnosticColor = function(color)
			local c = require("kanagawa.lib.color")
    		return { 
			fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
  		end

		return {
			-- Assign a static color to strings
            String = { fg = colors.palette.sakuraPink, italic = true },
            -- theme colors will update dynamically when you change theme!
            SomePluginHl = { fg = colors.theme.syn.type, bold = true },
			
			NormalFloat = { bg = "none" },
        	FloatBorder = { bg = "none" },
        	FloatTitle = { bg = "none" },

  	     	-- Save an hlgroup with dark background and dimmed foreground
    	    -- so that you can use it where your still want darker windows.
    	    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
    	    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

			TelescopeTitle = { fg = theme.ui.special, bold = false },
	        --TelescopePromptNormal = { bg = theme.ui.br_p1 },
   	     	--TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        	--TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
        	--TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
        	--TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        	--TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
		
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
 	        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
     	    PmenuSbar = { bg = theme.ui.bg_m1 },
        	PmenuThumb = { bg = theme.ui.bg_p2 },
		
			DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
		    DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
    		DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
    		DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
		}
    end,

	theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
