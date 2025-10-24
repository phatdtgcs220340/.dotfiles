return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    provider = "copilot",
    auto_suggestions_provider = "copilot",
    providers = {
      copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "claude-sonnet-4.5",
        extra_request_body = {
          temperature = 0,
          max_tokens = 8192,
        },
      },
    },
    behaviour = {
      auto_suggestions = false, -- Enable auto suggestions
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = true },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right",
      wrap = true,
      width = 30,
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
    },
  },
  -- Configure highlights to use terminal background
  config = function(_, opts)
    require("avante").setup(opts)
    
    -- Set transparent backgrounds to match terminal
    vim.api.nvim_set_hl(0, "AvanteTitle", { link = "Normal" })
    vim.api.nvim_set_hl(0, "AvanteReversedTitle", { link = "Normal" })
    vim.api.nvim_set_hl(0, "AvanteSubtitle", { link = "Normal" })
    vim.api.nvim_set_hl(0, "AvanteReversedSubtitle", { link = "Normal" })
    vim.api.nvim_set_hl(0, "AvanteThirdTitle", { link = "Normal" })
    vim.api.nvim_set_hl(0, "AvanteReversedThirdTitle", { link = "Normal" })
    vim.api.nvim_set_hl(0, "AvanteBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "AvanteNormal", { link = "Normal" })
  end,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- Optional dependencies
    "nvim-tree/nvim-web-devicons",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
