#!/bin/sh
sudo apt-get install -y emacs
emacs --batch --no-init-file --load ./_action_files/publish.el --funcall toggle-debug-on-error --funcall fastpages-publish-all