return {
	"folke/persistence.nvim",
	config = function()
		require("persistence").setup({
			dir = vim.fn.stdpath("data") .. "/sessions/", -- diretório onde as sessões serão salvas
			options = { "buffers", "curdir", "tabpages", "winsize" }, -- opções que serão salvas
		})
	end,
}
