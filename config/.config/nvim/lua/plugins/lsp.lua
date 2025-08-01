return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- Attach keymap to noice.nvim for better appearance
            local on_attach = function(_, bufnr)
                local opts = { buffer = bufnr, desc = "LSP Hover (Noice)" }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            end

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
                on_attach = on_attach
            })
            -- typescript
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })

            -- go
            lspconfig.gopls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })

            -- tailwindcss
            lspconfig.tailwindcss.setup({
            })
            --java
            lspconfig.jdtls.setup({
                cmd = { "jdtls", "--jvm-arg=-javaagent:/home/phatdo/.config/jdtls/lombok.jar" },
                settings = {
                    java = {
                        configuration = {
                            runtimes = {
                                {
                                    name = "JavaSE-17",
                                    path = vim.fn.trim(vim.fn.system("nix eval --raw nixpkgs#jdk17.home")),
                                },
                                {
                                    name = "JavaSE-21",
                                    path = vim.fn.trim(vim.fn.system("nix eval --raw nixpkgs#jdk21.home")),
                                }
                            },
                        }
                    }
                },
                on_attach = on_attach
            })
            lspconfig.nil_ls.setup({
                capabilities = capabilities,
                settings = {
                    ['nil'] = {
                        formatting = {
                            command = { "alejandra" },
                        },
                    },
                },
                on_attach = on_attach
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            -- bash
            lspconfig.bashls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
            -- lsp kepmap setting

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
