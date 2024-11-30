require('surround').setup(
{
  context_offset = 100,
  load_autogroups = false,
  mappings_style = "sandwich",
  map_insert_mode = true,
  quotes = {"'", "\""},
  brackets = {"(", "{", "["},
  space_on_closing_char = false,
  pairs = {
    nestable = {
      b = { "(", ")" },
      s = { "[", "]" },
      B = { "{", "}" },
      a = { "<", ">" },
    },
    linear = {
      q = { "'", "'" },
      t = { "`", "`" },
      d = { "\"", "\"" },
    },
  },
  prefix = "s",

})

require("presence").setup()

require("glow").setup({
  style = "dark",
  width = 120,
})

require("nvim-surround").setup()

require("neogen").setup()

vim.api.nvim_set_keymap('n', '<leader>u', '<cmd>UndotreeToggle<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>ai', '<cmd>AnsiEsc<cr>', {}) -- ansiesc. should go in misc

