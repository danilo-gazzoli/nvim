return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",     -- UI para o nvim-dap
			"theHamsta/nvim-dap-virtual-text", -- Variáveis no texto
			"nvim-telescope/telescope-dap.nvim", -- Integração com Telescope
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Configuração da UI
			dapui.setup()

			-- Eventos automáticos para abrir/fechar a UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			require("nvim-dap-virtual-text").setup()

			require("telescope").load_extension("dap")
		end,
	},
}
