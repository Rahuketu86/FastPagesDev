#!/bin/sh

add-apt-repository ppa:kelleyk/emacs
apt-get update
apt install emacs26
emacs --version
cd ${GITHUB_WORKSPACE}
emacs --batch --no-init-file --load ${GITHUB_WORKSPACE}/_action_files/publish.el --funcall toggle-debug-on-error --funcall fastpages-publish-all