return {
	"github/copilot.vim",
	{
		"saghen/blink.cmp",
		opts = {
			keymap = {
				preset = 'default',
				['<Tab>'] = {
					function(cmp)
						if require("copilot.suggestion").is_visible() then
							require("copilot.suggestion").accept()
							return true
						end
					end,
					'select_next',
					'fallback'
				},
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = false, -- Desativamos aqui para não conflitar com o Blink
				},
			},
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = {
					function(cmp)
						local copilot = require("copilot.suggestion")
						if copilot.is_visible() then
							copilot.accept()
							return true -- Interrompe o Blink e aceita o Copilot
						end
					end,
					"select_next",
					"fallback",
				},
			},
		},
	},
}
