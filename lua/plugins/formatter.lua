-- lua/plugins/formatter.lua
-- Configuración para conform.nvim (formateo y algunos linters)
return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- Ejecutar antes de escribir el buffer (al guardar)
    cmd = "ConformInfo",
    opts = function(_, opts) -- Permite extender la configuración por defecto de LazyVim para conform.nvim
      -- Añade tus formateadores y linters por tipo de archivo
      -- opts.formatters_by_ft y opts.linters_by_ft se fusionarán con la config de LazyVim
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
        go = { "gofumpt", "goimports" },
        rust = { "rustfmt" },
        python = { "ruff_format", "isort" }, -- ruff_format es muy rápido y completo. isort para imports.
        -- python = { "black" }, -- Alternativa a ruff_format

        dockerfile = { "hadolint" }, -- hadolint puede formatear y linter

        css = { "prettier" },
        html = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" }, -- Para formatear tu propia config de Neovim

        astro = { "prettier" }, -- Necesita prettier-plugin-astro en el proyecto

        -- Tailwind CSS se maneja con prettier si tienes prettier-plugin-tailwindcss en tu proyecto
        -- y Prettier está configurado para los filetypes relevantes (html, jsx, tsx, astro, etc.)
      })

      -- Configuración de linters que quieres que conform.nvim maneje (si no los cubre el LSP)
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft or {}, {
        go = { "golangci-lint" },
        -- rust = { "clippy" }, -- rust-analyzer ya lo integra bien
        -- python = { "ruff" }, -- ruff como linter es excelente, el LSP ruff_lsp o el extra lang.ruff pueden manejarlo
        dockerfile = { "hadolint" },
        css = { "stylelint" }, -- Necesita .stylelintrc en el proyecto
        -- javascript = { "eslint_d" }, -- El extra de typescript/json y el LSP suelen manejar eslint
        -- typescript = { "eslint_d" },
      })

      -- Configura el formateo al guardar. LazyVim ya hace esto, pero puedes ajustarlo.
      opts.format_on_save = {
        lsp_fallback = true, -- Si no hay formateador de conform.nvim, intenta con el LSP
        timeout_ms = 750,    -- Aumentar si los formateadores tardan mucho
      }

      -- También puedes configurar format_after_save si prefieres formatear después.
      -- opts.format_after_save = { lsp_fallback = true }

      -- Para algunos formateadores que necesitan ejecutarse en el directorio raíz del proyecto
      -- opts.formatters = {
      --   ["prettier"] = {
      --     cwd = require("conform.util").root_file({ ".prettierrc", ".prettierrc.json", ".prettierrc.js", "package.json" }),
      --   },
      -- }
      return opts
    end,
    -- Opcional: si quieres configurar conform.nvim desde cero y no fusionar con LazyVim,
    -- simplemente devuelve una tabla de opciones en lugar de usar la función:
    -- opts = {
    --   formatters_by_ft = { ... },
    --   linters_by_ft = { ... },
    --   format_on_save = { ... },
    -- }
  },
}
