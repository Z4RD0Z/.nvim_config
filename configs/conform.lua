local options = {
    formatters_by_ft = {
        javascript = {"prettier"},
        typescript = {"prettier"},
        javascriptreact = {"prettier"},
        typescriptreact = {"prettier"},
        svelte = {"prettier"},
        vue = {"prettier"},
        css = {"prettier"},
        html = {"prettier"},
        json = {"prettier"},
        yaml = {"prettier"},
        markdown = {"prettier"},
        lua = {"stylua"},
        sh = {"shfmt"}
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true
    }
}

require("conform").setup(options)
