-- ~/.config/nvim/lua/plugins/treesitter.lua
-- API nvim-treesitter rewrite (branche main, Neovim ≥ 0.11)
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({})

    -- Installer les parsers (asynchrone, no-op si déjà installés)
    require("nvim-treesitter").install({
      "bash", "c", "css", "dockerfile", "go", "hcl",
      "html", "javascript", "json", "lua", "markdown",
      "python", "rust", "terraform", "toml", "typescript",
      "vim", "vimdoc", "yaml",
    })

    -- Activer la coloration Tree-sitter pour ces filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash", "sh", "c", "css", "dockerfile", "go", "hcl",
        "html", "javascript", "json", "lua", "markdown",
        "python", "rust", "terraform", "toml", "typescript",
        "vim", "yaml",
      },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- Activer le pliage de code basé sur Tree-sitter
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "bash", "sh", "c", "go", "javascript", "json", "lua",
        "python", "rust", "typescript", "yaml",
      },
      callback = function()
        vim.wo[0][0].foldmethod = "expr"
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldenable = false  -- Ne pas plier par défaut
      end,
    })
  end,
}
