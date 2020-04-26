---
toc: true
layout: post
description: A minimal example of using markdown with fastpages.
categories: [orgmode]
title: Emacs Conifguration
---


<p>
This post contains sample configuration for my emacs in an org file 
</p>
<div id="outline-container-orgae16a24" class="outline-2">
<h2 id="orgae16a24">Emacs init.el</h2>
<div class="outline-text-2" id="text-orgae16a24">
<pre class="example">
(package-initialize)

(require 'org)
(org-babel-load-file
      (expand-file-name "configuration.org"
                         user-emacs-directory))
</pre>
</div>
</div>

<div id="outline-container-orga17ece9" class="outline-2">
<h2 id="orga17ece9">Emacs Customization Group</h2>
<div class="outline-text-2" id="text-orga17ece9">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>

<div id="outline-container-org066f75b" class="outline-2">
<h2 id="org066f75b">Emacs Repositories</h2>
<div class="outline-text-2" id="text-org066f75b">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>

<div id="outline-container-orgaaf6fb3" class="outline-2">
<h2 id="orgaaf6fb3">Personal Information</h2>
<div class="outline-text-2" id="text-orgaaf6fb3">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
<div id="outline-container-orgdcf0c89" class="outline-2">
<h2 id="orgdcf0c89">Emacs : Add Info directory</h2>
<div class="outline-text-2" id="text-orgdcf0c89">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
<div id="outline-container-org11d6982" class="outline-2">
<h2 id="org11d6982">Emacs: Backups</h2>
<div class="outline-text-2" id="text-org11d6982">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
<div id="outline-container-org9eb41b1" class="outline-2">
<h2 id="org9eb41b1">Emacs: SaveHist</h2>
<div class="outline-text-2" id="text-org9eb41b1">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
<div id="outline-container-org9ca7a1c" class="outline-2">
<h2 id="org9ca7a1c">Emacs Additional Infopath</h2>
<div class="outline-text-2" id="text-org9ca7a1c">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
<div id="outline-container-org43fe939" class="outline-2">
<h2 id="org43fe939">Utility Functions</h2>
<div class="outline-text-2" id="text-org43fe939">
</div>
<div id="outline-container-org45cb93a" class="outline-3">
<h3 id="org45cb93a">Function to open this configuration file</h3>
<div class="outline-text-3" id="text-org45cb93a">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
</div>

<div id="outline-container-org1d51682" class="outline-2">
<h2 id="org1d51682">Splash Screen and bars</h2>
<div class="outline-text-2" id="text-org1d51682">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>

<div id="outline-container-orgfa745f3" class="outline-2">
<h2 id="orgfa745f3">Configure Emacs for use-package</h2>
<div class="outline-text-2" id="text-orgfa745f3">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
<div id="outline-container-org3b147de" class="outline-2">
<h2 id="org3b147de">Improve performance on Windows</h2>
<div class="outline-text-2" id="text-org3b147de">
<p>
Improving File Saving Performance on windows.
</p>
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>

<div id="outline-container-org4ffe604" class="outline-2">
<h2 id="org4ffe604">Emacs Custom Theme</h2>
<div class="outline-text-2" id="text-org4ffe604">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>

<div id="outline-container-org37576cb" class="outline-2">
<h2 id="org37576cb">Setup Ido and smex</h2>
<div class="outline-text-2" id="text-org37576cb">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
<div id="outline-container-org727651d" class="outline-2">
<h2 id="org727651d">Setup Guru Mode</h2>
<div class="outline-text-2" id="text-org727651d">
<p>
Guru mode works by disabling common key bindings and pushing for
Emacs standard key bindings. Instead of global hook up Textmode and
other so that it plays nice with ido-mode.
</p>
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>

<div id="outline-container-org23f029d" class="outline-2">
<h2 id="org23f029d">Setup Magit</h2>
<div class="outline-text-2" id="text-org23f029d">
<p>
Magit is a git porcelain. With this we can stay within emacs for
configuration modifications and commiting to git.
</p>
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>

<div id="outline-container-org92c0828" class="outline-2">
<h2 id="org92c0828">Setup Company Mode</h2>
<div class="outline-text-2" id="text-org92c0828">
<p>
Company mode is used for autocompletion in Emacs.
</p>
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
<div id="outline-container-orgba19fca" class="outline-2">
<h2 id="orgba19fca">Org-Mode Settings</h2>
<div class="outline-text-2" id="text-orgba19fca">
<p>
Global settings for all the org-mode buffers.
</p>

'pygmentize' is not recognized as an internal or external command,
operable program or batch file.

<p>
Additional Org Mode plugins
</p>
<ul class="org-ul">
<li><p>
Org Mode with Twitter bootstrap(ox-twbs)
</p>
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.</li>
</ul>
</div>
</div>

<div id="outline-container-org66da513" class="outline-2">
<h2 id="org66da513">Nikola Blog Settings</h2>
<div class="outline-text-2" id="text-org66da513">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>

<div id="outline-container-orgd2f8d29" class="outline-2">
<h2 id="orgd2f8d29">Games</h2>
<div class="outline-text-2" id="text-orgd2f8d29">
</div>
<div id="outline-container-org69c88a2" class="outline-3">
<h3 id="org69c88a2">Chess</h3>
<div class="outline-text-3" id="text-org69c88a2">
'pygmentize' is not recognized as an internal or external command,
operable program or batch file.
</div>
</div>
</div>
