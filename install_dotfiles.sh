#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles.
############################

dir=~/dotfiles
olddir=~/dotfiles_old
files="config gitconfig gitignore gitignore_global lesskey pentadactylrc tmux.conf vim vimrc zprezto zpreztorc zshrc"

##########

# Create dotfiles_old in homedir.
echo "Creating $olddir for backup of any existing dotfiles in ~."
mkdir -p $olddir
echo "...done."

# Change to the dotfiles directory.
echo "Changing to the $dir directory."
cd $dir
echo "...done."

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks.
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir."
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
