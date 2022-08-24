set inccommand=nosplit

" vim.highlight.create is deprecated, use vim.api.nvim_set_hl instead. See :h deprecated

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=$runtimepath

source ~/.vimrc

" lsp keymappings
" vim.api.nvim_buf_set_keymap(0, 'n', '<silent>K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true}) 
" vim.api.nvim_buf_set_keymap(0, 'n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
" vim.api.nvim_buf_set_keymap(0, 'n', '<C-n>', '<cmd>lua vim.lsp.buf.goto_prev()<CR>', {noremap = true})
" vim.api.nvim_buf_set_keymap(0, 'n', '<C-p>', '<cmd>lua vim.lsp.buf.goto_next()<CR>', {noremap = true})

" " changing color of errors in lsp to not red
" hi LspReferenceWrite ctermbg=237 guibg=#00ffff
" hi LspReferenceText ctermbg=237 guibg=#00ffff
" hi LspReferenceRead ctermbg=237 guibg=#00ffff

" let g:LanguageClient_serverCommands = {
      " \ 'vue': ['vls']
      " \ }

" lsp config, trying vue first 
lua << EOF
-- vue
-- require'lspconfig'.vuels.setup {}

-- ts
require'lspconfig'.tsserver.setup {
  on_attach = function()
    print("do i?")
  end
}

-- python
require'lspconfig'.pyright.setup {}

-- go
require'lspconfig'.gopls.setup {
  on_attach = function()
    print("i be here...")
    vim.keymap.set("n", "J", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    -- ctrl-t jump back on tag list 
  end
}

-- setting up auto complete
vim.lsp.set_log_level('DEBUG')

-- getting code actions
-- when use set_keymap over buf_set_keymap, sets on initial load
-- buf_set_keymap waits for another source for me
-- why?
vim.api.nvim_set_keymap('n','<space>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true})
vim.api.nvim_buf_set_keymap(0, 'n', '<space><space>bw', ":echo 'wa'<CR>", {noremap = true})

local custom_lsp_attach = function(client)
  -- See `:help nvim_buf_set_keymap()` for more information
  -- vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true}) 
  -- vim.api.nvim_buf_set_keymap(0, 'n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  -- vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})
  -- vim.api.nvim_buf_set_keymap(0, 'n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
  -- vim.api.nvim_buf_set_keymap(0, 'n', '<C-n>', '<cmd>lua vim.lsp.buf.goto_prev()<CR>', {noremap = true})
  -- vim.api.nvim_buf_set_keymap(0, 'n', '<C-p>', '<cmd>lua vim.lsp.buf.goto_next()<CR>', {noremap = true})
  -- ... and other keymappings for LSP

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- using vim api to set continue for vimspector
  vim.api.nvim_buf_set_keymap(0, 'n', '<space>dc', '<cmd>vimspector#Continue()<CR>', {noremap = true})

  -- For plugins with an `on_attach` callback, call them here. For example:
  -- require('completion').on_attach()

end

-- stopping errors from being red

-- vim.api.nvim_set_hl
-- vim.api.nvim_set_hl("DiagnosticError", { 
vim.highlight.create("DiagnosticError", { 
  guifg = "Cyan",
  ctermfg = "Cyan",
  gui= "bold"
}, false)

on_attach = custom_lsp_attach

local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Experimenting with experimental ghost text
  -- cmp-config.experimental.ghost_text(true) 

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  -- adding this line for html support with lsp
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }
  -- require('lspconfig')['vuels'].setup {
    -- capabilities = capabilities
  -- }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }

EOF
