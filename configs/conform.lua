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

    format_after_save = {
        lsp_fallback = true
    }
}

require("conform").setup(options)
