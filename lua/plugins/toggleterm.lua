return {
	"akinsho/toggleterm.nvim",
	config = true,
	require("toggleterm").setup({
		direction = "float",
		open_mapping = [[<c-\>]],
	}),
}
