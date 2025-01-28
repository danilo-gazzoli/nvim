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

			-- Configuração do adaptador e configuração do Python
			dap.adapters.python = {
				type = "executable",
				command = "/usr/bin/python", -- Substitua pelo caminho correto do interpretador Python
				args = { "-m", "debugpy.adapter" },
			}

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}", -- Executa o arquivo Python aberto no buffer
					pythonPath = function()
						-- Retorna o interpretador Python padrão ou configurado
						local venv_path = os.getenv("VIRTUAL_ENV")
						if venv_path then
							return venv_path .. "/bin/python"
						end
						return "/usr/bin/python" -- Substitua conforme necessário
					end,
				},
			}
			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = {
					os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
				},
			}

			dap.configurations.typescript = {
				{
					type = "node2",
					request = "launch",
					name = "Launch file",
					program = "${file}", -- Executa o arquivo TypeScript aberto no buffer
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
					console = "integratedTerminal",
				},
				{
					type = "node2",
					request = "attach",
					name = "Attach to process",
					processId = require("dap.utils").pick_process,
					cwd = vim.fn.getcwd(),
				},
			}

			dap.adapters.ruby = {
				type = "executable",
				command = "bundle",
				args = { "exec", "readapt", "serve" },
			}

			dap.configurations.ruby = {
				{
					type = "ruby",
					request = "launch",
					name = "Debug Ruby script",
					program = "${file}",
				},
				{
					type = "ruby",
					request = "attach",
					name = "Attach to Ruby process",
					remoteHost = "127.0.0.1",
					remotePort = 1234,
					remoteWorkspace = vim.fn.getcwd(),
				},
			}
		end,
	},
}
