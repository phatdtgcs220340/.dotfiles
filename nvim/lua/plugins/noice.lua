return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                progress = {
                    enabled = false, -- disable LSP progress like "diagnosing", "validating", etc.
                },
                hover = {
                    enabled = true, -- still show hover docs in the nice UI
                },
                signature = {
                    enabled = true, -- show signature help if you want
                },
                message = {
                    enabled = false, -- disable LSP messages like "No code actions available"
                },
            },
            messages = {
                enabled = true,  -- keep normal messages like `:echo`
                view = "notify", -- or "mini" if you want them in a corner
            },
            notify = {
                enabled = false, -- disable native `vim.notify` handling if it’s too noisy
            },
            routes = {
                -- filter out noisy messages like diagnostics or `written` messages
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "diagnosing",
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "validating",
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = "msg_show",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
        })
    end
}
