-- Archivo: ~/.config/nvim/lua/plugins/rest.lua

return {
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    cmd = "Rest",
    build = false,

    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-telescope/telescope.nvim",

      {
        "j-hui/fidget.nvim",
        opts = {},
      },

      {
        "lunarmodules/lua-mimetypes",
        name = "lua-mimetypes",
      },

      {
        "manoelcampos/xml2lua",
        name = "xml2lua",
      },

      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}

          if not vim.tbl_contains(opts.ensure_installed, "http") then
            table.insert(opts.ensure_installed, "http")
          end
        end,
      },
    },

    init = function()
      local lazy_path = vim.fn.stdpath("data") .. "/lazy"

      -- lua-mimetypes
      package.path = package.path
        .. ";"
        .. lazy_path
        .. "/lua-mimetypes/?.lua"
        .. ";"
        .. lazy_path
        .. "/lua-mimetypes/lua/?.lua"
        .. ";"
        .. lazy_path
        .. "/lua-mimetypes/lua/?/init.lua"

      -- xml2lua
      package.path = package.path
        .. ";"
        .. lazy_path
        .. "/xml2lua/?.lua"
        .. ";"
        .. lazy_path
        .. "/xml2lua/src/?.lua"
        .. ";"
        .. lazy_path
        .. "/xml2lua/src/?/init.lua"

      vim.g.rest_nvim = {
        request = {
          hooks = {
            encode_url = true,
            user_agent = "rest.nvim",
            set_content_type = true,
          },
        },

        response = {
          hooks = {
            decode_url = true,
            format = true,
          },
        },

        cookies = {
          enable = true,
        },

        env = {
          enable = true,
          pattern = ".*%.env.*",
        },

        ui = {
          winbar = true,
          keybinds = {
            prev = "H",
            next = "L",
          },
        },

        highlight = {
          enable = true,
          timeout = 750,
        },
      }
    end,

    -- Add telescope extension
    config = function()
      require("telescope").load_extension("rest")
    end,

    keys = {
      {
        "<leader>rr",
        "<cmd>Rest run<cr>",
        desc = "Run HTTP Request",
      },
      {
        "<leader>re",
        "<cmd>Telescope rest select_env<cr>",
        desc = "Select HTTP Environment",
      },
      {
        "<leader>rl",
        "<cmd>Rest last<cr>",
        desc = "Run Last HTTP Request",
      },
      {
        "<leader>ro",
        "<cmd>Rest open<cr>",
        desc = "Open REST Result",
      },
      {
        "<leader>rc",
        "<cmd>Rest cookies<cr>",
        desc = "Open REST Cookies",
      },
      {
        "<leader>rg",
        "<cmd>Rest logs<cr>",
        desc = "Open REST Logs",
      },
    },
  },
}
