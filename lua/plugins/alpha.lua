return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                    ]],
			[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
			[[                                                    ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files<cr>"),
			dashboard.button("r", " " .. " Recent files", "<cmd>Telescope oldfiles<cr>"),
			dashboard.button("g", " " .. " Find text", "<cmd>Telescope live_grep<cr>"),
			dashboard.button("c", " " .. " Config", "<cmd>e $MYVIMRC<cr>"),
			dashboard.button("s", " " .. " Restore Session", "<cmd>lua require('persistence').load()<cr>"),
			dashboard.button("x", " " .. " Lazy Extras", "<cmd>LazyExtras<cr>"),
			dashboard.button("l", "󰒲 " .. " Lazy", "<cmd>Lazy<cr>"),
			dashboard.button("q", " " .. " Quit", "<cmd>qa<cr>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 8
		alpha.setup(dashboard.opts)
	end,
}
