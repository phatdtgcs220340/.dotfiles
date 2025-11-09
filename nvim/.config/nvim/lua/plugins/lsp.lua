return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            -- Capabilities (for nvim-cmp, etc.)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local home_dir = vim.env.HOME

            -- on_attach: set up keymaps, etc.
            local on_attach = function(_, bufnr)
                local opts = { buffer = bufnr }
                local map = vim.keymap.set

                map("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover (Noice)" })
                map("n", "gi", vim.lsp.buf.implementation, opts)
                map("n", "gd", vim.lsp.buf.definition, opts)
                map("n", "gD", vim.lsp.buf.declaration, opts)
                map("n", "gr", vim.lsp.buf.references, opts)
                map("n", "<leader>rn", vim.lsp.buf.rename, opts)
                map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                map("n", "<Leader>f", function()
                    vim.lsp.buf.format({ async = true })
                end, { desc = "Format File" })

                -- List symbols (fzf-lua)
                map("n", "<leader>fm", function()
                    local ft = vim.bo.filetype
                    local symbols = ({
                        javascript = "function",
                        typescript = "function",
                        java = "class",
                        lua = "function",
                    })[ft] or "function"
                    require("fzf-lua").lsp_document_symbols({ symbols = symbols })
                end, { desc = "List Methods (FZF)" })
            end

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            -- TypeScript / JavaScript
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- Go
            vim.lsp.config("gopls", {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- TailwindCSS
            vim.lsp.config("tailwindcss", {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- Java (jdtls)
            vim.lsp.config("jdtls", {
                capabilities = capabilities,
                on_attach = on_attach,

                cmd = { "jdtls", string.format("--jvm-arg=-javaagent:%s/.config/jdtls/lombok.jar", home_dir) },
                settings = {
                    java = {
                        configuration = {
                            runtimes = {
                                {
                                    name = "JavaSE-21",
                                    path = vim.env.JAVA_HOME,
                                },
                            },
                        },
                    },
                },
            })

            -- Nix (nil)
            vim.lsp.config("nil_ls", {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    ["nil"] = {
                        formatting = {
                            command = { "alejandra" },
                        },
                    },
                },
            })

            -- YAML
            vim.lsp.config("yamlls", {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- Python
            vim.lsp.config("pyright", {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- Bash
            vim.lsp.config("bashls", {
                capabilities = capabilities,
                on_attach = on_attach,
            })

            local servers = {
                "lua_ls",
                "ts_ls",
                "gopls",
                "tailwindcss",
                "jdtls",
                "nil_ls",
                "yamlls",
                "pyright",
                "bashls",
            }

            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },
}
