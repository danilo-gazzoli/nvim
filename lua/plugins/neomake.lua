return {
	"neomake/neomake",
	lazy = false, -- Carrega o plugin imediatamente
	config = function()
		-- Configuração básica do Neomake
		vim.g.neomake_open_list = 2          -- Abre a lista de erros automaticamente em caso de problemas
		vim.g.neomake_verbose = 0            -- Reduz a verbosidade
		vim.g.neomake_place_signs = 1        -- Adiciona ícones de erro nas linhas
		vim.g.neomake_highlight_columns = 1  -- Destaca colunas específicas com problemas
		vim.g.neomake_logfile = "/tmp/neomake.log" -- Opcional: habilita logs para depuração
	end,
}
