#!/bin/sh

# We suppose you have already cloned ~/.vim

# Get the vundle plugin -- required by the other plugins
if [ ! -e ~/.vim/bundle/vundle ] 
then 
    git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# Create a backup of the old vimrc if needed. Link the new vimrc
if [ -f ~/.vimrc ]
    then mv ~/.vimrc ~/.vimrc.$(date +%s).bak
fi
echo "source ~/.vim/vimrc" > ~/.vimrc

# Install dictionnaries
mkdir -p ~/.vim/spell
if [ -z "$(ls ~/.vim/spell/)" ]
then wget -q --directory-prefix=$HOME/.vim/spell/ \
    http://ftp.vim.org/vim/runtime/spell/fr.utf-8.spl \
    http://ftp.vim.org/vim/runtime/spell/fr.utf-8.sug \
    http://ftp.vim.org/vim/runtime/spell/en.utf-8.spl \
    http://ftp.vim.org/vim/runtime/spell/en.utf-8.sug
fi

# Create the backup and tmp directory
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/tmp

# Install other plugins (including the molokai colortheme)
echo "Install bundles w/vundle (warns molokai not found, and will install it)"
vim +BundleInstall +qall

# Install C/C++ support for YouCompleteMe
#echo "Installing C/C++ support for YCM (clang)."
#cd ~/.vim/bundle/YouCompleteMe
#./install.sh --clang-completer

# Install fonts
echo "Patch font for Powerline. You might need to install 'python-fontforge'."
mkdir -p ~/.fonts
cd ~/.fonts
echo "Patch DejaVu in ~/.fonts you migh need to install 'ttf-dejavu-core'."
~/.vim/bundle/vim-powerline/fontpatcher/fontpatcher /usr/share/fonts/truetype/ttf-dejavu/DejaVuSansMono.ttf

echo "Done."
