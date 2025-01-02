---
-- LSP configuration
---
local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
	local opts = {buffer = bufnr}

	vim.keymap.set('n', 'fs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'op', '<cmd>lua vim.diagnostic.open_float()<cr>')
	vim.keymap.set('n', 'bh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)

	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
	float_boarder = "rounded",
	sign_text = {
		error = '✘',
		warn = '▲',
		hint = '⚑',
		info = '»',
	}
})


local cmp = require('cmp')
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})


vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = {
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})


require('mason').setup({})
require('mason-lspconfig').setup({
  -- I install clangd locally, and elixir-ls using Mason which refuses it when in
  -- ensure installed
  ensure_installed = {'lua_ls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})


local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
