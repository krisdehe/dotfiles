-- ~/.config/nvim/lua/plugins/lsp.lua
-- API vim.lsp.config / vim.lsp.enable (Neovim ≥ 0.11)
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      -- Capabilities enrichies avec nvim-cmp (si installé)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      if ok then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Raccourcis LSP activés à l'attachement d'un serveur
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
          end

          map("gd", vim.lsp.buf.definition, "Aller à la définition")
          map("gD", vim.lsp.buf.declaration, "Aller à la déclaration")
          map("gr", vim.lsp.buf.references, "Voir les références")
          map("gi", vim.lsp.buf.implementation, "Aller à l'implémentation")
          map("K", vim.lsp.buf.hover, "Documentation au survol")
          map("<leader>rn", vim.lsp.buf.rename, "Renommer le symbole")
          map("<leader>ca", vim.lsp.buf.code_action, "Actions de code")
          map("<leader>e", vim.diagnostic.open_float, "Détails du diagnostic")
          map("[d", vim.diagnostic.goto_prev, "Diagnostic précédent")
          map("]d", vim.diagnostic.goto_next, "Diagnostic suivant")
        end,
      })

      -- Configuration par défaut (appliquée à tous les serveurs)
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Configuration spécifique pour lua_ls (éviter les warnings Neovim)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          },
        },
      })

      -- Activer tous les serveurs installés via Mason
      vim.lsp.enable({
        "lua_ls", "pyright", "bashls", "yamlls",
        "dockerls", "terraformls", "jsonls",
      })
    end,
  },
}
