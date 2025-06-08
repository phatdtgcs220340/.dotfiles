return {
    {
        "williamboman/mason.nvim",
        -- NOTE: comment it to install jdtls (java language server)
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
        config = function()
            require("mason-lspconfig").setup({
                -- manually install packages that do not exist in this list please
                ensure_installed = { "lua_ls", "ts_ls" },
                automatic_enable = false
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            -- lua
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
            -- typescript
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            -- tailwindcss
            lspconfig.tailwindcss.setup({
            })
            --java
            lspconfig.jdtls.setup({
                cmd = { "/home/pd204/.local/share/jdtls/bin/jdtls", "--jvm-arg=-javaagent:/home/pd204/.config/jdtls/lombok.jar" },
                settings = {
                    java = {
                        configuration = {
                            runtimes = {
                                {
                                    name = "JavaSE-17",
                                    path = "/usr/lib/jvm/java-17-openjdk-amd64",
                                },
                                {
                                    name = "JavaSE-21",
                                    path = "/usr/lib/jvm/java-21-openjdk-amd64",
                                }
                            },
                        }
                    }
                }
            })
            -- lsp kepmap setting
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<Leader>f', function()
                vim.lsp.buf.format { async = true }
            end, {})
            -- list all methods in a file
            -- working with go confirmed, don't know about other, keep changing as necessary
            vim.keymap.set("n", "<leader>fm", function()
                local filetype = vim.bo.filetype
                local symbols_map = {
                    javascript = "function",
                    typescript = "function",
                    java = "class",
                    lua = "function",
                }
                local symbols = symbols_map[filetype] or "function"
                require("fzf-lua").lsp_document_symbols({ symbols = symbols })
            end, {})
        end,
    },
}
