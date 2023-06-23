vim.cmd('autocmd!')


vim.scriptencoding = 'utf8'
vim.opt.encoding = 'utf8'
vim.opt.fileencoding = 'utf8'



vim.opt.ignorecase = true
vim.wo.number = true
vim.opt.relativenumber= true
vim.opt.mouse=a
vim.opt.clipboard=unnamed
vim.opt.ruler= true
vim.opt.showcmd= true
vim.opt.cursorline= true
vim.opt.showmatch= true
vim.opt.shiftwidth=2
vim.opt.laststatus=2
vim.opt.hlsearch= true
vim.opt.incsearch= true
vim.opt.ignorecase= true
vim.opt.smartcase= true
vim.opt.smarttab= true
vim.opt.inccommand='split'
vim.opt.ai = true
vim.opt.si = true
vim.opt.path:append {'**'}
vim.opt.wildignore:append {'*/node_modules/* '}


