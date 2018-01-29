set shell=/bin/bash

" VIM config file to support mostly C++ with fish.
" Author: Bryan Wodi
" Adapted from Gerhard G. <https://gist.github.com/rocarvaj/2513367>.
" And from my old version <https://github.com/talk2bryan/dotfiles/blob/7418dfed6d8754c53a2de01b61279278734cca99/vimrc>
" Date: January 4, 2018.
"

set nocp
filetype plugin on

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" defining shell as interactive so you can run commands from vim
" Make vim's :! shell behave like a command prompt (i.e. aliases)
" set shellcmdflag=-ic

" show the (partial) command as it is being typed
set showcmd

" enhance command-line completion
set wildmenu
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent
" configure tabwidth, insert spaces instead of tabs
set tabstop=4 		" tab width is 4 spaces
set shiftwidth=4 	" indent also with 4 spaces
set expandtab 		" expand tabs to spaces

" enable backspace
set backspace=indent,eol,start


" wrap lines at 80 chars
set textwidth=80
" show a line at the 81st character for non-java, 101st for java
if has ('autocmd')
    autocmd FileType cpp,cc,cxx,h,hpp,python,go,borg,BUILD,sh,javascript,js setlocal colorcolumn=81
    autocmd FileType java setlocal colorcolumn=101
endif

" turn syntax highlighting on
set t_Co=256
syntax on
colorscheme industry

" Auto-adjust windows when resizing: equal width and height. (To make vsplit windows better behaved / less manually managed.)
if has ('autocmd')
    autocmd VimResized * exec 'normal \<C-w>='
endif

" turn line numbers on
set number
" show relative number to current line
" set relativenumber

" show the filename in the window title bar
set title
" turn off error bells
set noeb vb t_vb=
" disable screen flash with an autocmd
if has ('autocmd')
	au GUIEnter * set vb t_vb=
endif
" VSPLIT
" 		map keys to move between screen in vsplit mode
" tab moves between screens
map <Tab> <C-W>w
" - closes a window
map - <C-W>c


" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/cpp_src/
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
" set tags+=~/.vim/tags/qt4

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Statusline
" Status line, including git branch info
" set statusline=%{fugitive#statusline()}  " git status
set statusline=
set statusline+=\ %t     " tail of the filename
set statusline+=\ %m     " modified flag
set statusline+=%r       " readonly flag
set statusline+=%y       " filetype
set statusline+=%=       " left right separator
set statusline+=%c       " cursor column
set statusline+=\ %l/%L  " cursor line / total lines
set statusline+=\ %P     " percent through file
set laststatus=2         " enable this hot monster

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

" autocmd FileType cpp set omnifunc=omni#cpp#complete#Main


" DoxygenToolkit for comments
let g:DoxygenToolkit_authorName="Bryan Wodi <talk2kamp@gmail.com>"
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------"


" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
" map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
map <F5> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q . <CR>

" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" jump back from definition with <S-F12>
map <S-F12> <C-t>
" in diff mode we use the spell check keys for merging
if &diff
  ” diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif
