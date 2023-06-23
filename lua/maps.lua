vim.cmd([[

let mapleader = " "

" Configuraciones 
nnoremap <Leader>t :TestNearest<CR>
nnoremap <Leader>T :TestFile<CR>
nnoremap <Leader>TT :TestSuite<CR>
" mover las terminales
nnoremap <Leader>> 10<C-w>
nnoremap <Leader>< 10<C-W>

" insertar semicolon 
nnoremap <Leader>; $a;<Esc>

" remapeo para guardar y salir 
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" comandos recortados
cnoreabbrev tree NERDTreeToggle
cnoreabbrev  blame Gblame
cnoreabbrev  find NERDTreeFind
cnoreabbrev  diff Gdiff

" plugs 
map <Leader>nt :NERDTreeFind<CR>
map <Leader>p :Files<CR>
map <Leader>ag :Ag<CR> 

" for emmet 
let g:user_emmet_mode='n'
let g:user_emmet_leader_key='<Leader>'

nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<cr>

if &filetype == "javascript" || &filetype == "python"
	inoremap <c-space> <C-x><C-u>
else
	inoremap <silent><expr> <c-space> coc#refres()
endif 

]])