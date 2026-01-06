return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ibhagwan/fzf-lua",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",      -- Lua
          "pyright",     -- Python
          "ts_ls",       -- TypeScript/JavaScript
          "rust_analyzer", -- Rust
        },
        automatic_installation = true,
      })

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Set up global fzf-lua keybindings (outside of LSP on_attach)
      vim.keymap.set({'n', 'v'}, '<leader>f', '<cmd>lua require("fzf-lua").files()<CR>', { desc = 'Find files' })
      vim.keymap.set({'n', 'v'}, '<leader>g', '<cmd>lua require("fzf-lua").live_grep()<CR>', { desc = 'Ripgrep' })
      vim.keymap.set({'n', 'v'}, '<leader>e', '<cmd>lua require("fzf-lua").buffers()<CR>', { desc = 'Recent buffers' })
      vim.keymap.set({'n', 'v'}, '<leader>p', '<cmd>lua require("fzf-lua").commands()<CR>', { desc = 'Commands' })

      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }

        local ok, fzf = pcall(require, 'fzf-lua')
        if ok and fzf.lsp_definitions then
          vim.keymap.set('n', 'gd', fzf.lsp_definitions, { buffer = bufnr, desc = 'Go to definition' })
          vim.keymap.set('n', 'gr', fzf.lsp_references, { buffer = bufnr, desc = 'Find references' })
          vim.keymap.set('n', 'gI', fzf.lsp_implementations, { buffer = bufnr, desc = 'Find implementations' })
        else
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = 'Find references' })
          vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Find implementations' })
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr, desc = 'Type definition' })
        end

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      end

      -- Capabilities for nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Setup LSP servers using new vim.lsp.config API
      local servers = {
        lua_ls = {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        pyright = {
          on_attach = on_attach,
          capabilities = capabilities,
        },
        ts_ls = {
          on_attach = on_attach,
          capabilities = capabilities,
        },
        rust_analyzer = {
          on_attach = on_attach,
          capabilities = capabilities,
        },
      }

      -- Configure and enable each LSP server
      for server_name, config in pairs(servers) do
        vim.lsp.config(server_name, config)
        vim.lsp.enable(server_name)
      end

      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })
    end,
  },
}
