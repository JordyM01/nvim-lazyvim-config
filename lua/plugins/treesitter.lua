-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "LazyFile", "VeryLazy" },
  -- opts_extend = { "ensure_installed" }, -- Esta línea ya la tienes
  -- Al igual que con Mason, si `opts_extend` funciona como se espera, la siguiente estructura es correcta.
  -- De lo contrario, para una fusión más robusta:
  -- opts = function(_, current_opts)
  --   local new_parsers = { "rust", "dockerfile", "css", "tsx", "astro" }
  --   current_opts.ensure_installed = vim.list_extend(current_opts.ensure_installed or {}, new_parsers)
  --   -- Aquí puedes eliminar duplicados si es necesario
  --   if current_opts.highlight and current_opts.highlight.enable == nil then current_opts.highlight.enable = true end
  --   if current_opts.indent and current_opts.indent.enable == nil then current_opts.indent.enable = true end
  --   return current_opts
  -- end,
  opts = {
    highlight = { enable = true }, -- Manteniendo tus opciones existentes
    indent = { enable = true },   -- Manteniendo tus opciones existentes
    ensure_installed = {
      -- Tus parsers existentes:
      "bash",
      "c",
      "diff",
      "html",
      "go",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
      "templ",
      "terraform",

      -- Parsers adicionales recomendados:
      "rust",
      "dockerfile",
      "css",
      "tsx", -- Para JavaScript/TypeScript con JSX
      "astro",
      -- "comment", -- Útil para algunos plugins que analizan comentarios
      -- "regex",   -- Si trabajas mucho con expresiones regulares
    },
    -- Otras opciones de nvim-treesitter que podrías querer mantener o añadir:
    -- auto_install = true, -- Instalar parsers automáticamente al abrir un archivo si faltan
    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = "<c-space>",
    --     node_incremental = "<c-space>",
    --     scope_incremental = false, -- o "<Plug>(nvim-treesitter-increment-selection-scope)"
    --     node_decremental = "<bs>", -- o "<Plug>(nvim-treesitter-decrement-selection)"
    --   },
    -- },
  },
}
