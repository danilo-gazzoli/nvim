require("core.options")
require("core.snippets")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{ import = "lazyvim.plugins.extras.lsp.none-ls" },
	{ import = "lazyvim.plugins.extras.lang.typescript" },
	{ import = "lazyvim.plugins.extras.lang.json" },
	{ import = "lazyvim.plugins.extras.lang.angular" },
	{ import = "lazyvim.plugins.extras.lang.clang" },
	{ import = "lazyvim.plugins.extras.lang.ruby" },
	{ import = "lazyvim.plugins.extras.lang.python" },
	{ import = "lazyvim.plugins.extras.lang.java" },
	{ import = "lazyvim.plugins.extras.lang.sql" },
	{ import = "lazyvim.plugins.extras.lang.git" },
	{ import = "lazyvim.plugins.extras.lang.elixir" },
	{ import = "lazyvim.plugins.extras.lang.vue" },
	{ import = "lazyvim.plugins.extras.editor.telescope" },
	{ import = "lazyvim.plugins.extras.ui.alpha" },
	{ import = "lazyvim.plugins.extras.ui.dashboard-vim" },
	{ import = "lazyvim.plugins.vscode" },
	{ import = "lazyvim.plugins.util.dot" },
	{ import = "lazyvim.plugins.util.mini-hipatterns" },
	{ import = "lazyvim.plugins.test.core" },
	{ import = "lazyvim.plugins.coding.yanky" },
	{ import = "lazyvim.plugins.editor.fzf" },
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.gitsigns"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.snacks"),
	require("plugins.alpha"),
	require("plugins.comment"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
	require("plugins.none-ls"),
	require("plugins.lsp"),
	require("plugins.nvim-cmp"),
	require("plugins.persistence"),
	require("plugins.undotree"),
	require("plugins.cmp-git"),
	require("plugins.autotag"),
	require("plugins.live-server"),
	require("plugins.bracey"),
	require("plugins.vim-rails"),
	require("plugins.vim-test"),
	require("plugins.neomake"),
	require("plugins.toggleterm"),
})
