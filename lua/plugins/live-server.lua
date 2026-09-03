return {
  "barrett-ruth/live-server.nvim",
  init = function()
    vim.g.live_server = {}
  end,
  build = "npm install -g live-server",
}
