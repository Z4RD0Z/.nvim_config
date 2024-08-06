local lint = require('lint')
lint.linters.phpstan = {
    cmd = "/your/path/to/sh", -- expose stan in docker
    stdin = true,
    args = { "--error-format=json" },
    stream = "stdout",
    ignore_exitcode = true,
    parser = require('lint.parser').json
}

lint.linters_by_ft = {
    php = { "phpstan" }
}

lint.linters.phpstan.on_save = true
