return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = "<C-a>",
                accept_word = false,
                accept_line = false,
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
        },
        panel = { enabled = false },
      })
    end,
  },
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = {
        'rafamadriz/friendly-snippets',
    },

    opts = {
      keymap = {
        preset = 'default',
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
      },

      cmdline = {
        sources = function()
          local type = vim.fn.getcmdtype()
          if type == '/' or type == '?' then return { 'buffer' } end
          if type == ':' then return { 'cmdline', 'path' } end
          return {}
        end,
      },

      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        list = { selection = { preselect = false, auto_insert = true } },
      },
    },
    opts_extend = { "sources.default" }
  }
}
