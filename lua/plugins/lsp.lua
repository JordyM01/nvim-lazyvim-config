-- lua/plugins/lsp.lua
-- Configuración para nvim-lspconfig, complementando los extras de LazyVim.
return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- Go
        gopls = {
          -- Ejemplo de configuración específica si es necesaria:
          -- settings = {
          --   gopls = {
          --     analyses = { unusedparams = true },
          --     staticcheck = true,
          --   },
          -- },
        },

        -- Rust
        rust_analyzer = {
          -- El extra de lang.rust suele manejar esto muy bien.
          -- Ejemplo de configuración específica:
          -- settings = {
          --   ["rust-analyzer"] = {
          --     checkOnSave = { command = "clippy" },
          --   },
          -- },
        },

        -- Python: pyright es una buena opción. ruff_lsp es otra excelente alternativa moderna.
        -- El extra lang.python o lang.ruff probablemente ya configure uno de estos.
        pyright = {
          -- settings = {
          --  python = {
          --    analysis = {
          --      typeCheckingMode = "basic", -- "off", "basic", "strict"
          --    },
          --  },
          --},
        },
        -- ruff_lsp = {}, -- Si prefieres ruff para LSP y tienes el extra lang.ruff

        -- Docker
        dockerls = {}, -- Mason name: dockerls o dockerfile-language-server-nodejs
        -- O usa: dockerfile_language_server_nodejs = {},

        -- CSS
        cssls = { -- Mason name: css-lsp
          -- filetypes = { "css", "scss", "less" }, -- Ya suele estar bien configurado por defecto
        },

        -- HTML
        html = { -- Mason name: html-lsp
          -- filetypes = { "html" },
        },

        -- JavaScript / TypeScript
        -- tsserver es manejado excelentemente por el extra lang.typescript.
        -- No es necesario listarlo aquí si el extra está habilitado,
        -- pero si necesitaras alguna configuración MUY específica que el extra no cubre:
        tsserver = {
          -- init_options = {
          --   plugins = {
          --     {
          --       name = "@vue/typescript-plugin",
          --       location = "/path/to/node_modules/@vue/typescript-plugin", -- Cambiar según tu proyecto
          --       languages = { "vue" },
          --     },
          --   },
          -- },
        },

        -- Astro
        astro = { -- Mason name: astro-language-server
          -- filetypes = { "astro" }, -- nvim-lspconfig debería detectarlo
          -- init_options = {
          --   typescript = {
          --     tsdk = function() -- Intenta encontrar tsdk en el proyecto local
          --       local root_dir = require("lazyvim.util").get_root()
          --       if root_dir then
          --         return root_dir .. "/node_modules/typescript/lib"
          --       end
          --       return nil -- O un path global por defecto
          --     end,
          --   },
          -- },
        },

        -- Tailwind CSS
        -- El extra lang.tailwind configura esto.
        tailwindcss = {
          -- filetypes = { "astro", "html", "javascriptreact", "typescriptreact", "svelte", "vue", "css", "heex", "elixir", "php", "rust", "go" },
          -- root_dir = require("lspconfig.util").root_pattern("tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts", "postcss.config.js"),
        },

        -- Otros LSPs que puedas necesitar:
        -- jsonls = {}, -- El extra lang.json configura esto
        -- yamlls = {},
        -- bashls = {},
        -- luau_lsp = {-- para Roblox, por ejemplo
        --  settings = {
        --    ["luau-lsp"] = {
        --      requireCyclicDependencies = false,
        --      types = {
        --        definitionFiles = vim.fn.stdpath("config") .. "/misc/luau-roblox.d.luau", -- ejemplo
        --        roblox = true,
        --      }
        --    }
        --  }
        --},
      },
      -- La función setup para configuración avanzada por servidor (como en tu ejemplo para tsserver con typescript.nvim)
      -- generalmente es manejada por los extras de LazyVim. Si no usas un extra para un LSP particular
      -- y necesita un setup especial, lo harías aquí.
      -- setup = {
      --   -- ejemplo: tsserver = function(_, opts) require("typescript").setup({ server = opts }); return true end,
      -- },
    },
  },
}
