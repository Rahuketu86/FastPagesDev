#!/bin/sh

apt-get install -y emacs-nox
emacs --version
# cd ${GITHUB_WORKSPACE}
emacs --batch --no-init-file --load ./_action_files/publish.el --funcall toggle-debug-on-error --funcall fastpages-publish-all

ls -la ./_posts