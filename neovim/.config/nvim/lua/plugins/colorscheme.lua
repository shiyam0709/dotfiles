return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      --[[    color_overrides = {
        mocha = {
          rosewater = "#d8b7b0",
          flamingo = "#d1a8a8",
          pink = "#d49fc1",
          mauve = "#a88fd0",
          red = "#d17b8d",
          maroon = "#d08c96",
          peach = "#d98f6f",
          yellow = "#d0c28a",
          green = "#86b78a",
          teal = "#71b7a0",
          sky = "#6bb6c9",
          sapphire = "#5a9bb9",
          blue = "#6f8cc4",
          lavender = "#8e98c9",
          text = "#a1adcf",
          subtext1 = "#8d9bb4",
          subtext0 = "#8a92b2",
          overlay2 = "#7a7f97",
          overlay1 = "#6a7085",
          overlay0 = "#585c70",
          surface2 = "#4a4d5d",
          surface1 = "#373a47",
          surface0 = "#252835",
          --          base = "#161624",
          --          mantle = "#14161e",
          --         crust = "#0d0d16",
        },
      },]]
      --
      custom_highlights = function(colors)
        return {
          CmpGhostText = { fg = colors.overlay1, style = { "italic" } },
        }
      end,
    })
    vim.cmd("colorscheme catppuccin")
  end,
}
