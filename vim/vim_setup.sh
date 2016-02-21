#!/bin/bash
#author hsinhoyeh yhh92u@gmail.com
#goal: this script help you to automatically setup the vim environment under mac

VIMPATH=~/.vim
VIMBKPATH=~/.vim_bk

if [ -d $VIMPATH ] ; then
    mv $VIMPATH $VIMBKPATH
fi

#setup pathgen
if [ ! -d $VIMPATH ] ; then 
    mkdir -p $VIMPATH/autoload $VIMPATH/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

fetch() {
    DST=$1
    SRC=$2
    if [ ! -d $DST ] ; then
        git clone --verbose $SRC $DST
    fi
}

#setup color-sampler-pack
fetch $VIMPATH/bundle/Colour-Sampler-Pack https://github.com/vim-scripts/Colour-Sampler-Pack.git

#setup command-t
fetch $VIMPATH/bundle/command-t https://github.com/wincent/Command-T.git

#setup delimitmate
fetch $VIMPATH/bundle/delmitmate https://github.com/vim-scripts/delimitMate.vim.git

#setup fugitive
fetch $VIMPATH/bundle/fugitive https://github.com/tpope/vim-fugitive.git

#setup nerdtree
fetch $VIMPATH/bundle/nerdtree https://github.com/scrooloose/nerdtree.git

#setup pyflakes
#TODO install pyflake
fetch $VIMPATH/bundle/pyflakes https://github.com/kevinw/pyflakes-vim.git

#setup tagbar
fetch $VIMPATH/bundle/tagbar git://github.com/majutsushi/tagbar

#setup vim-powerline
fetch $VIMPATH/bundle/powerline https://github.com/powerline/powerline.git

#install colors-solarized
fetch $VIMPATH/bundle/vim-colors-solarized git://github.com/altercation/vim-colors-solarized.git

#install vim-gitgutter
fetch $VIMPATH/bundle/vim-gitgutter https://github.com/airblade/vim-gitgutter.git

#install vim-go
fetch $VIMPATH/bundle/vim-go https://github.com/fatih/vim-go.git

#install syntastic
fetch $VIMPATH/bundle/syntastic https://github.com/scrooloose/syntastic.git

#if [ ! -f ~/.vimrc ] ; then
#     CPWD=`pwd`
#    ln -s $CPWD/.vimrc_mac ~/.vimrc
#fi

