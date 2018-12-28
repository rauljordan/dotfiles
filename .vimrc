execute pathogen#infect()
call pathogen#helptags()

filetype plugin on

set shell=/bin/sh
set splitright
set guifont=UbuntuMono:h13

let mapleader = ","
map <leader>z :Goyo<cr>
map <leader>m :MRU<CR>
map <leader>w <c-w><c-w><cr>
map <leader>n :NERDTreeToggle<CR>
map <leader>s :Ack 
map <leader>o :CtrlP<CR>
map <space> /
map <c-space> ?
map <leader>ba :1,1000 bd!<cr>

set nu

set clipboard=unnamed
filetype plugin indent on
set shiftwidth=2
set softtabstop=2
set tabstop=2

set incsearch
set ignorecase smartcase
set nohlsearch
set expandtab
set suffixesadd+=.js

set splitright
set splitbelow
set noswapfile
set nobackup

let g:go_fmt_command = "goimports"
let g:go_list_tyoe = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']

autocmd FileType go nmap <leader>r  <Plug>(go-run)

function! s:build_go_files()
  let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)
