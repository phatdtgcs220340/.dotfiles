return {
    'mfussenegger/nvim-dap',
    config = function()
        local dap = require('dap')

        dap.configurations.java = {
            {
                type = 'java',
                request = 'attach',
                name = "Attach to Spring Boot",
                hostName = "localhost",
                port = 5005,
            },
        }

        require('dap.ext.vscode').load_launchjs()
    end
}
