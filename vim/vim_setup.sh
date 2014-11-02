#!/bin/bash
#author hsinhoyeh yhh92u@gmail.com
#goal: this script help you to automatically setup the vim environment under mac


ENV=MAC
#ENV=UBUNTU

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

#setup color-sampler-pack
DPATH=$VIMPATH/bundle/Colour-Sampler-Pack
if [ ! -d $DPATH ] ; then
    git clone https://github.com/vim-scripts/Colour-Sampler-Pack.git $DPATH
fi

#setup command-t
DPATH=$VIMPATH/bundle/command-t
if [ ! -d $DPATH ] ; then
    git clone https://github.com/wincent/Command-T.git $DPATH
fi

#setup delimitmate
DPATH=$VIMPATH/bundle/delmitmate
if [ ! -d $DPATH ] ; then
    git clone https://github.com/vim-scripts/delimitMate.vim.git $DPATH
fi

#setup fugitive
DPATH=$VIMPATH/bundle/fugitive
if [ ! -d $DPATH ] ; then
    git clone https://github.com/tpope/vim-fugitive.git $DPATH
fi

#setup nerdtree
DPATH=$VIMPATH/bundle/nerdtree
if [ ! -d $DPATH ] ; then
    git clone https://github.com/scrooloose/nerdtree.git $DPATH
fi

#setup pyflakes
DPATH=$VIMPATH/bundle/pyflakes
if [ ! -d $DPATH ] ; then
    #TODO install pyflake
    git clone https://github.com/kevinw/pyflakes-vim.git $DPATH
fi

#setup tagbar
DPATH=$VIMPATH/bundle/tagbar
if [ ! -d $DPATH ] ; then
    git clone git://github.com/majutsushi/tagbar $DPATH
fi

#setup vim-powerline
DPATH=$VIMPATH/bundle/vim-powerLine
if [ ! -d $DPATH ] ; then
    git clone https://github.com/Lokaltog/vim-powerline.git $DPATH
fi

if [ "$ENV" == "MAC" ] ; then
    #install colors-solarized
    DPATH=$VIMPATH/bundle/vim-colors-solarized 
    if [ ! -d $DPATH ] ; then 
        git clone git://github.com/altercation/vim-colors-solarized.git $DPATH
    fi
fi 

DPATH=$VIMPATH/bundle/vim-gitgutter
if [ ! -d $DPATH ] ; then
    git clone https://github.com/airblade/vim-gitgutter.git $DPATH
fi

DPATH=$VIMPATH/bundle/vim-go
if [ ! -d $DPATH ] ; then
    git clone https://github.com/fatih/vim-go.git $DPATH
fi

DPATH=$VIMPATH/bundle/syntastic
if [ ! -d $DPATH ] ; then
    git clone https://github.com/scrooloose/syntastic.git $DPATH
fi

if [ ! -f ~/.vimrc ] ; then
     CPWD=`pwd`
    ln -s $CPWD/.vimrc_mac ~/.vimrc
fi

