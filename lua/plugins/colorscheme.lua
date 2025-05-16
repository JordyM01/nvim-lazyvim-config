-- lua/plugins/colorscheme.lua

-- if true then return {} end -- Uncommenting this line enables the configuration

return {

  -- Selected colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight", -- colorscheme
    },
  },
  -- 1. Catppuccin (ya lo teníamos)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "macchiato", -- o "mocha", "frappe", "latte"
      -- ... (otras opciones de Catppuccin que ya tenías) ...
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = true,
        mason = true,
        telescope = { enabled = true },
        native_lsp = { enabled = true },
      },
    },
  },

  -- 2. Tokyo Night
  {
    "folke/tokyonight.nvim",
    name = "tokyonight", -- Nombre para referenciarlo
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- Estilos disponibles: "storm", "night", "moon". También hay "day" (claro).
      -- transparent = true, -- Descomenta si quieres fondo transparente
      -- terminal_colors = true, -- Usa los colores del tema en la terminal de Neovim
      styles = {
        -- Puedes personalizar colores de comentarios, keywords, etc.
        comments = { italic = true },
        keywords = { italic = true },
        -- sidebars = "dark", -- Ejemplo: "dark", "transparent"
        -- floats = "dark",   -- Ejemplo: "dark", "transparent"
      },
    },
  },

  -- 3. Gruvbox
  {
    "ellisonleao/gruvbox.nvim", -- Un port popular de Gruvbox para Neovim
    name = "gruvbox",
    lazy = false,
    priority = 1000,
    opts = {
      -- Opciones comunes de Gruvbox:
      -- terminal_colors = true,
      -- bold = true,
      -- italic = {
      --   strings = true,
      --   emphasis = true,
      --   comments = true,
      --   operators = false,
      --   folds = true,
      -- },
      -- undercurl = true,
      -- underline = true,
      -- strikethrough = true,
      -- invert_selection = false,
      -- invert_signs = false,
      -- invert_tabline = false,
      -- invert_intend_guides = false,
      -- inverse = true, -- Recomiendo true para una mejor legibilidad de algunos elementos UI
      -- contrast = "medium", -- Puedes probar "soft", "medium", "hard"
      -- palette_overrides = {}, -- Para personalizar colores específicos
      -- groups = {}, -- Para personalizar grupos de resaltado específicos
    },
    -- Gruvbox a veces necesita que se establezca el fondo explícitamente,
    -- aunque LazyVim con su opción de `colorscheme` suele manejarlo.
    -- Si ves colores raros, puedes añadir una función config:
    -- config = function(_, opts)
    --   require("gruvbox").setup(opts)
    --   vim.o.background = "dark" -- o "light" si prefieres la variante clara de Gruvbox
    --   -- vim.cmd.colorscheme "gruvbox" -- No es necesario si usas la opción de LazyVim
    -- end,
  },
}
