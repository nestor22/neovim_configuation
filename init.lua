
require('base')
require('maps')
require('plugins')


local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
  )
nvim_lsp.flow.setup{
  on_attach=on_attach,
  capabilities=capabilities
}


local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- local status, cmp=pcall(require, "cmp")
-- if(not status) then return end
-- local lsplink = require 'lspkind'

-- cmp.setup({
--     snippet = {
--       expand=function(args)
--         require('luasnip').lsp_expand(args.body)
--       end,
--     },
--     mapping = cmp.mapping.preset.insert({
--       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.abort(),
--       ['<CR>'] = cmp.mapping.confirm({ 
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = true 
--       }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     }),
  
--   sources = cmp.config.sources({
--     {name = 'nvim_lsp'},
--     {name = 'buffer'}
--   }),
--   formatting = {
--     format= lspkind.cmp_format({with_text = false, maxwidth = 50 })
--   }
-- })

-- vim.cmd[[
--   setCompleteopt=menuone, noinsert,noselect
--   highlight! default link CmpItemKind CmpItemMenuDefault
-- ]]


local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
