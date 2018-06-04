" Plugins
call plug#begin('~/.vim/plugged')
Plug 'chrisbra/Recover.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'neomake/neomake'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
call plug#end()

" Linting
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_sh_enabled_makers = ['shellcheck']
let g:neomake_xml_xmllint_maker = { 'exe': 'xmllint', 'args': ['--noout'] }
let g:neomake_xml_enabled_makers = ['xmllint']
let g:neomake_java_enabled_makers = ['']

" Matchit
runtime macros/matchit.vim

" Main settings
syntax on
filetype plugin indent on
set autochdir
set autoindent
set autoread
set hidden
set history=200
set hlsearch
set ignorecase
set incsearch
set infercase
set linebreak
set nocompatible
set noesckeys
set nojoinspaces
set number
set smartcase
set virtualedit=onemore
set wildmenu

" Abbreviations (command-line only)
cab co ~/Documents/Code
cab co ~/Documents/
cab dk ~/Desktop

" Disable things
map Q <Nop>
map K <Nop>
map ' <Nop>

" Don't clutter my dirs up with swp and tmp files
set backupdir=~/.tmp
set directory=~/.tmp

" Look
colorscheme lucius
set background=light
set colorcolumn=80
set cursorline
set display=lastline " show as much text as possible
set gcr=n:blinkon0
set guioptions=c
set listchars=tab:▸\ ,eol:¬
set noruler
set nowrap
set scrolloff=20
set shortmess+=I " disable intro text
set t_ut=
if has("gui_running")
  set columns=100 "120
  set lines=40 "70
endif

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Shortcuts
let mapleader = ","
set timeoutlen=500
nmap k gk
nmap j gj
noremap <Leader>bp :tabe ~/.bash_profile<CR>
noremap <Leader>fn :echo expand('%:p')<CR>
noremap <Leader>hl :let @/=""<CR>
noremap <Leader>i magg=G`azz
noremap <Leader>li :set list!<CR>
"noremap <Leader>pd :call GeneratePdf()<CR>
noremap <Leader>rf :call RenameFile()<CR>
noremap <Leader>rt :call ReadingTimeAndWordCount()<CR>
noremap <Leader>sw :call SoftWrap()<CR>
noremap <Leader>vi :tabe ~/.vimrc<CR>
noremap <Leader>w <C-w>w
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>p "+P

" Highlight accidental non-breaking spaces
au BufNewFile,BufRead,BufWritePost * match Error / /

" Markdown mode
au BufWinEnter,BufRead,BufWritePost * noremap J J
au BufWinEnter,BufRead,BufWritePost *.{md} call MarkdownMode()

" Punctuation undo points
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap , ,<c-g>u
inoremap ; ;<c-g>u
inoremap : :<c-g>u
inoremap * *<c-g>u
inoremap - -<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap <CR> <CR><c-g>u

" Functions
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! MarkdownMode()
  setlocal ft=markdown
  setlocal wrap
  setlocal fo=wat
  call clearmatches()
  noremap J Jvipgq
endfunction

function! SoftWrap()
  let s:old_fo = &formatoptions
  let s:old_tw = &textwidth
  set fo=
  set tw=999999 " works for paragraphs up to 12k lines
  normal gggqG
  let &fo = s:old_fo
  let &tw = s:old_tw
endfunction

function! ReadingTimeAndWordCount()
  silent write
  let l:word_count = system("wc ".expand('%')." | awk {'print $2'}")
  let l:word_count = l:word_count/1 " parsing the number
  echo l:word_count/200." minutes (". l:word_count." words)"
endfunction

function! GeneratePdf()
  silent write
  silent !rm -f ~/Desktop/%:t.pdf
  silent !pandoc -V geometry:margin=1in -o ~/Desktop/%:t.pdf % --pdf-engine=xelatex
  !open ~/Desktop/%:t.pdf
endfunction

" Same repo for all systems is the way to go
let OS=substitute(system('uname -s'),"\n","","")
if (OS == "Darwin")
  set guifont=Menlo\ Regular:h14
  noremap <Leader>bu :tabe ~/Documents/scripts/build.sh<CR>
else
  set guifont=Monospace\ Regular:h12
  noremap <Leader>bu :tabe ~/Documents/misc/build.sh<CR>
endif
