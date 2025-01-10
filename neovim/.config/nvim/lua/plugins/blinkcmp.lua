return {
  "saghen/blink.cmp",
  enabled = false,
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  opts = {
    keymap = { preset = "default" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "normal",
    },
    completion = {
      menu = { border = "single" },
      documentation = { auto_show = true, auto_show_delay_ms = 1000, window = { border = "single" } },
      ghost_text = { enabled = true },
    },
    signature = { enabled = true, window = { border = "single" } },
  },
}
