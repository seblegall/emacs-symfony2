#!/bin/bash

emacsDir=~
backupDir=.emacs.d.backup
backupFile=.emacs.backup

while true; do
    read -p "This installation will replace your Emacs configuration. Would you like to back-up existing files? (Y/n)" yn
    case $yn in
        [Yy]* ) mv -r $emacsDir/.emacs.d $emacsDir/$backupDir; mv $emacsDir/.emacs $emacsDir/$backupFile; break;;
        [Nn]* ) rm $emacsDir/.emacs; rm -rf $emacsDir/.emacs.d; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

mv ../emacs-symfony2 $emacsDir/.emacs.d;
printf "\e[32m Emacs for Symfony2 has been successfully installed\n";
