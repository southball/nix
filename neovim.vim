" General settings
set cindent autowrite autoindent incsearch
set tabstop=2 shiftwidth=2 softtabstop=2 timeoutlen=50
set number noerrorbells
set mouse=a autoread expandtab cursorline hidden
syntax on
nnoremap <silent> <F12> :w !clip.exe<CR><CR>
nnoremap ; :
" imap jk <esc>
" imap kj <esc>

" Terminal Settings
set splitbelow
tnoremap <Esc> <C-\><C-N>
tnoremap <C-w> <C-\><C-N><C-w>
augroup TerminalStuff
        au!
        autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
set guicursor=

" Other settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0

let NERDTreeShowHidden = 1
