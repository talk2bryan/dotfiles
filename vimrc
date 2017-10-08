" Vundle setup
set nocompatible
filetype off
syntax off

" important: first, clone...
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" then :PluginInstall ;and PluginUpdate as root.


" set the runtime path for vundle
set rtp+=~/.vim/bundle/Vundle.vim/

" start the vundle environment
call vundle#begin()

" old: Plugin gmarik/Vundle.vim
Plugin 'VundleVim/Vundle.vim'


" to install a plugin add it here and run :PluginInstall.
" to update the plugins run :PluginInstall! or :PluginUpdate
" to delete a plugin remove it here and run :PluginClean


" Other bundles:
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'matze/vim-move'

call vundle#end()
filetype plugin indent on

"Enable syntax highlighting
syntax on

" Enhance command line completion
set wildmenu

autocmd FileType bzl AutoFormatBuffer buildifier

" Key binding for auto-ClangFormat to C-K. (Note that this is different than :FormatCode)
noremap <C-K> :ClangFormat<CR>
inoremap <C-K> :ClangFormat<CR>

" Clang include fixer adds one new header at a time to the current file.
" Also calls blazedeps some possibility that this combination will be annoying,
" because blazedeps can become interactive and block gvim indefinitely.
" Also note the save: BlazeDepsUpdate does nothing if the file is not saved.
" See go/include-fixer

au BufRead,BufNewFile *.as  set syntax=actionscript

set expandtab
set tabstop=2
set shiftwidth=2
colorscheme torte

" label the current line and show relative line numbers
set number
set relativenumber

" Show the filename in the window titlebar
set title
" Show the (partial) command as it is being typed
set showcmd

" Show a line at the 81st character
autocmd FileType cpp,cc,cxx,h,hpp,python,go,borg,BUILD,sh,javascript,js setlocal colorcolumn=81
autocmd FileType java setlocal colorcolumn=101

" Make vim's :! shell behave like a command prompt (i.e. aliases)
set shellcmdflag=-ic

" Options for YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_extra_conf_globlist = ['~/.ycm_extra_conf.py']
let g:ycm_always_populate_location_list = 1
let g:ycm_global_ycm_extra_conf = ['~/.vim/.ycm_extra_conf.py']

" Status line, including git branch info
set statusline=%{fugitive#statusline()}  " git status
set statusline+=\ %t     " tail of the filename
set statusline+=\ %m     " modified flag
set statusline+=%r       " readonly flag
set statusline+=%y       " filetype
set statusline+=%=       " left right separator
set statusline+=%c       " cursor column
set statusline+=\ %l/%L  " cursor line / total lines
set statusline+=\ %P     " percent through file
set laststatus=2         " enable this hot monster

" Auto-adjust windows when resizing: equal width and height. (To make vsplit windows better behaved / less manually managed.)
autocmd VimResized * exec 'normal \<C-w>='

" Disable audible and visible bells (http://vim.wikia.com/wiki/Disable_beeping)
set noerrorbells visualbell t_vb=
if has ('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
