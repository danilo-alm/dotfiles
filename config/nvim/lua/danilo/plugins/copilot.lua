return {
  "zbirenbaum/copilot.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("copilot").setup({
      print("Hello, "),
    })
  end,
}
