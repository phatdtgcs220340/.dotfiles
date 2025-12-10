return {
    "tamton-aquib/keys.nvim",
    config = function ()
        require("keys").setup {
            enable_on_startup = true
        };
    end
}
