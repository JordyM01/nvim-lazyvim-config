return {
  -- El nombre del plugin que encontraste en GitHub
  "linux-cultist/venv-selector.nvim",

  -- Dependencias: Asegura que estos plugins se carguen si son necesarios
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap-python", -- Opcional, pero bueno para la integración de depuración
    "nvim-telescope/telescope.nvim", -- Necesario para la interfaz de selección
  },

  -- Carga perezosa: Activa el plugin solo cuando abras un archivo de Python
  ft = { "python" },

  -- Configuración principal del plugin
  config = function()
    require("venv-selector").setup({
      -- Puedes dejar la configuración por defecto o personalizarla aquí.
      -- Por ejemplo, puedes especificar los nombres de las carpetas de venv a buscar.
      -- name = { ".venv", "venv", ".virtualenv" }
    })
  end,

  -- Atajos de teclado (la forma recomendada de usarlo)
  keys = {
    -- Crea un atajo de teclado en modo normal.
    -- <leader>pv significa "presiona tu tecla líder y luego 'p' y 'v'".
    -- <cmd>VenvSelect<cr> es el comando que ejecuta el plugin.
    { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Python: Seleccionar Entorno Virtual" },
  },
}
