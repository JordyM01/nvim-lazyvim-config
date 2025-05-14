-- lua/plugins/mason.lua
return {
  "williamboman/mason.nvim",
  event = "LazyFile",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  -- opts_extend = { "ensure_installed" }, -- Esta línea ya la tienes
  -- Si `opts_extend` funciona como se espera para fusionar listas, la siguiente estructura es correcta.
  -- De lo contrario, para una fusión más robusta y estándar con lazy.nvim, se podría usar:
  -- opts = function(_, current_opts)
  --   local new_tools = { ... } -- lista de nuevas herramientas
  --   current_opts.ensure_installed = vim.list_extend(current_opts.ensure_installed or {}, new_tools)
  --   -- Aquí puedes eliminar duplicados si es necesario
  --   return current_opts
  -- end,
  opts = {
    ensure_installed = {
      -- Tus herramientas existentes:
      "templ",

      -- LSPs (Servidores de Lenguaje)
      "gopls", -- Go
      "rust-analyzer", -- Rust
      "pyright", -- Python (alternativa: ruff-lsp)
      "dockerfile-language-server-nodejs", -- Docker (alternativa: dockerls)
      "css-lsp", -- CSS
      "html-lsp", -- HTML
      "typescript-language-server", -- TypeScript/JavaScript (alternativa: tsserver)
      "astro-language-server", -- Astro
      "tailwindcss-language-server", -- Tailwind CSS
      "json-lsp", -- JSON (a menudo incluido por extras de LazyVim como lang.json)
      "lua-language-server", -- Lua (para tu config de Neovim)

      -- Formatters
      "gofumpt", -- Go
      "goimports", -- Go
      -- "rustfmt" (generalmente se instala con `rustup component add rustfmt`, no siempre vía Mason)
      "ruff", -- Python (formateador y linter)
      "black", -- Python (formateador alternativo)
      "isort", -- Python (ordenador de imports)
      "stylua", -- Lua
      "prettier", -- Web (JS, TS, CSS, HTML, JSON, Markdown, Astro, etc.)
      "shfmt", -- Shell scripts
      "stylelint", -- CSS (también linter)

      -- Linters
      "golangci-lint", -- Go
      -- "clippy" (generalmente se instala con `rustup component add clippy`, no siempre vía Mason)
      "hadolint", -- Dockerfiles
      "shellcheck", -- Shell scripts
      "eslint_d", -- JavaScript/TypeScript (si el LSP no lo cubre completamente)
    },
    -- Puedes añadir otras configuraciones de Mason aquí si es necesario
    -- ui = {
    --   border = "rounded",
    -- },
  },
}
