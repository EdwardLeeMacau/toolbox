"----------------- Vundle ----------------
"
set nocompatible             " not compatible with the old-fashion vi mode
filetype off                 " required!

" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif

call vundle#end()

"
"----------------- End Vundle --------------


" Performance
set ttyfast
set lazyredraw

set directory-=.                                " Don't store swapfiles in the current directory

set number                                      " Show line numbers
set expandtab                                   " Expand tabs to spaces
set softtabstop=4
set shiftwidth=4
set tabstop=8                                   " Actual tabs occupy 8 characters
set list                                        " Show tabs and trailing white spaces
set listchars=tab:▸\ ,trail:▫

set ruler                                       " Show where you are
set laststatus=2                                " Always show status line
set wildmenu                                    " Show a navigation menu for tab completion in vim commands bar
set wildmode=longest:full,list

syntax on
