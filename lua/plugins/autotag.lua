return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter", -- Carrega ao entrar no modo de inserção
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
