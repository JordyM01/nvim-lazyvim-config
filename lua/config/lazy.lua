local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    -- MODIFICACIÓN AQUÍ: Añade la tabla 'opts' para especificar el colorscheme
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        colorscheme = "tokyonight", -- O "tokyonight", o el nombre del tema que instalaste
        -- Puedes añadir otras opciones de LazyVim aquí si las necesitas, por ejemplo:
        -- auto_format = true,
        -- ui = { theme = "auto" } -- si quieres que componentes UI como lualine sigan el tema
      },
    },

    -- Tus extras de LazyVim (sin cambios)
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.json" }, -- Useful for prettier, eslint which are used on the web
    { import = "lazyvim.plugins.extras.lang.typescript" }, -- For JS, TS, JSX, TSX
    { import = "lazyvim.plugins.extras.lang.tailwind" }, -- For LSP de TailwindCSS

    -- import/override with your plugins (esto carga tu lua/plugins/theme.lua, lsp.lua, etc.)
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  -- La sección 'install' es principalmente para la configuración inicial.
  -- La opción 'opts.colorscheme' en "LazyVim/LazyVim" es la que prevalece para el uso diario.
  install = { colorscheme = { "tokyonight", "habamax", "catppuccin" } }, -- Puedes dejar esto o simplificarlo
  checker = {
    enabled = true,
    notify = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
