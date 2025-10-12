return {
  -- Copilot completions
  {
    "github/copilot.vim",
    lazy = false,
  },

  -- CopilotChat integration
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" }, -- reuse Copilot's auth
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>cc", ":CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
      { "<leader>ce", ":CopilotChatExplain<CR>", desc = "Explain code" },
      { "<leader>ct", ":CopilotChatTests<CR>", desc = "Generate tests" },
    },
  },
}

