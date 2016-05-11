#!/bin/bash

emacsDir=~
backupDir=.emacs.d.backup
backupFile=.emacs.backup


if [ -d ~/$emacsDir/.emacs.d ]; then
  while true; do
      read -p "This installation will replace your Emacs configuration. Would you like to back-up existing files? (Y/n)" yn
      case $yn in
          [Yy]* )
            mv $emacsDir/.emacs.d $emacsDir/$backupDir;
            mv $emacsDir/.emacs $emacsDir/$backupFile;
            rm $emacsDir/.emacs;
            rm -rf $emacsDir/.emacs.d;
            break;;
          [Nn]* )
            rm $emacsDir/.emacs;
            rm -rf $emacsDir/.emacs.d;
            break;;
          * )
            echo "Please answer yes or no.";;
      esac
  done
fi

cd ..
mv emacs-symfony2 $emacsDir/.emacs.d;
cd $emacsDir/.emacs.d
printf "\e[32m Emacs for Symfony2 has been successfully installed\n";
