return {
  {
    "seblj/roslyn.nvim",
    ft = "cs",
    config = function()
      require("roslyn").setup({
        config = {
          settings = {
            ["csharp|background_analysis"] = {
              dotnet_analyzer_diagnostics_scope = "fullSolution",
              dotnet_compiler_diagnostics_scope = "fullSolution",
            },
          },
        },
        -- Esto ayuda a detectar el archivo de solución más rápido
        choose_sln = function(solutions)
          return solutions[1]
        end,
      })
    end,
  },
}
