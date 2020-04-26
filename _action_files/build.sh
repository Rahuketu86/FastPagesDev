#!/bin/sh

apt-get install -y emacs
emacs --version
cd ${GITHUB_WORKSPACE}
emacs --batch --no-init-file --load ${GITHUB_WORKSPACE}/_action_files/publish.el --funcall toggle-debug-on-error --funcall fastpages-publish-all