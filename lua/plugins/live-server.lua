-- ~/.config/nvim/lua/plugins/live-server.lua
return {
  {
    "barrett-ruth/live-server.nvim",
    -- Carga el plugin solo para tipos de archivo web comunes
    ft = { "html", "css", "javascript" },
    cmd = "LiveServer", -- Carga el plugin cuando se ejecuta el comando
    opts = {
      -- Aquí puedes configurar opciones, como el puerto, el navegador, etc.
      -- port = 8080,
      -- browser = "firefox",
    },
  },
}
