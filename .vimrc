" Thomas Jansson 2016

"""""""""""""""""""""""""""""""""""
" VIM PLUG SETUP and some downloads
" http://vimawesome.com/
"""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'jacoborus/tender' " Color
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes' " http://vimcolors.com/?utf8=%E2%9C%93&bg=dark&colors=term&order=newest&page=3
"Plug 'sirver/ultisnips'
" Read https://github.com/honza/vim-snippets/blob/master/UltiSnips/tex.snippets
" Read https://github.com/honza/vim-snippets/blob/master/UltiSnips/python.snippets

"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'valloric/youcompleteme' " Too slow
"Plug 'nvie/vim-flake8' # Conflicts with spell checking:
"Plug 'scrooloose/nerdcommenter'
"Plug 'davidhalter/jedi-vim' """ TO annoying
"Plug 'vim-latex/vim-latex'
"Plug 'gi1242/vim-tex-autoclose'  " Use \c to close enviroments
"Plug 'klen/python-mode'
"Plug 'flazz/vim-colorschemes'
"Plug 'junegunn/seoul256.vim'
"Plug 'altercation/vim-colors-solarized'
call plug#end()

setlocal foldmethod=manual
let g:pymode_rope = 0
let g:jedi#show_call_signatures = "0"

""""""""""""""""""""""""
" Setup plugins settings
""""""""""""""""""""""""
syntax enable
syntax on
let python_highlight_all=1

"let g:indent_guides_enable_on_vim_startup = 1

let g:rehash256 = 1
let g:solarized_termcolors=256
set t_Co=256
set background=dark
colorscheme tender

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Airline
let g:airline#extensions#tabline#enabled = 1

"Nerdcommenter
" let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

noremap <C-l> :CtrlP ../<CR>
noremap <C-x> :CtrlP ~/QI<CR>
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Only tabularize the first =
map <S-F5> :Tabularize /^[^=]*\zs=<cr>
" Align all the , in alist of dicts or tupples
map <S-F6> :Tabularize /,\zs<cr>
" Tabularize elements of a dict
map <S-F7> :Tabularize /:\zs<cr>

set tabpagemax=50
map <F8> :tabp<cr>
map <F9> :tabn<cr>

" NERDtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['\.pyc$']
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:python_version_2 = 1
"let NERDTreeMapOpenInTab='<ENTER>'

" Syntastic
let g:syntastic_python_checkers = ['pyflakes']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }



""""""""""""""""""""
" My hacks
""""""""""""""""""""
" MAC has a fucking idiotic keyboard I hate so intensely
" :" Map Ctrl-A -> Start of line, Ctrl-E -> End of line
map <C-a> <Home>
map <C-e> <End>
nnoremap <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <F5> :w<CR> :! ./%<CR>

highlight Search term=standout ctermfg=3 cterm=standout
highlight Visual term=standout ctermfg=4 cterm=standout
set breakindent
set hlsearch
set backspace+=start,eol,indent
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
set expandtab
set ignorecase
set noerrorbells
set novisualbell
set nowrap
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=0
set virtualedit=all
set wildignore=*.swp,*.bak,*.pyc,*.class
set ttyfast

command! Q  quit
command! W  write
command! Wq wq

""""""""""""""""""
"" Filetypes
""""""""""""""""""
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
autocmd BufRead,BufNewFile *.tex set spell
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us

""""""""""""""""""""""""""""""""
" Spell checker
""""""""""""""""""""""""""""""""
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline ctermfg=1 cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline ctermfg=1 cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline ctermfg=1 cterm=underline

"switch spellcheck languages
let g:myLang = 0
let g:myLangList = [ "nospell", "en_us", "da" ]
"let g:myLangList = [ "nospell", "en_us" ]
function! MySpellLang()
  "loop through languages
  let g:myLang = g:myLang + 1
  if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
  if g:myLang == 0 | set nospell | endif
  if g:myLang == 1 | setlocal spell spelllang=en_us | endif
  if g:myLang == 2 | setlocal spell spelllang=da | endif
  echo "language:" g:myLangList[g:myLang]
endf
map <F7> :call MySpellLang()<CR>
imap <F7> <C-o>:call MySpellLang()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" Tell vim to remember certain things when we exit
" http://vim.wikia.com/wiki/VimTip80
""""""""""""""""""""""""""""""""""""""""""""""""""
" '10 : marks will be remembered for up to 10 previously edited files
" "100 : will save up to 100 lines for each register
" :20 : up to 20 lines of command-line history will be remembered
" % : saves and restores the buffer list
" n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
