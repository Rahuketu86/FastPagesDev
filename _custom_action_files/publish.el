(require 'package)
(package-initialize)
(unless package-archive-contents
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-refresh-contents))
(dolist (pkg '(org-plus-contrib htmlize s))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'org)
(require 'ox-rss)
(require 'ox-publish)
(require 'ox-html)
(setq org-html-htmlize-output-type 'css)
(setq org-publish-project-alist
	'(

    ("org-post-fastpages"
	    ;; Path to your org files.
	    :base-directory "./_org/_posts"
	    :base-extension "org"

	    ;; Path to your Jekyll project.
	    :publishing-directory "./_posts/"
	    :recursive t
	    :publishing-function org-html-publish-to-html
	    :html-extension "md"
	    :body-only t ;; Only export section between <body> </body>
      )


      ("org-static-fastpages"
	    :base-directory "./_org/assets"
	    :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	    :publishing-directory "./assets/"
	    :recursive t
	    :publishing-function org-publish-attachment
	    )

      ("org-images-fastpages"
	    :base-directory "./_org/images"
	    :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
	    :publishing-directory "./images/"
	    :recursive t
	    :publishing-function org-publish-attachment
	    )
      ("fastpages" :components ("org-post-fastpages" "org-static-fastpages" "org-images-fastpages"))

  ))

(defun fastpages-publish-all ()
  "Publish the blog to HTML."
  (interactive)
  (org-publish-all))

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (defun jekyll-include (inc-tmpl url)
    (s-lex-format "{% include ${inc-tmpl} content='<a href=\"${url}\">${url}</a>' %}"))


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (defun convert-to-link (text)											      ;;
  ;;   (let (														      ;;
  ;;    st_str))														      ;;
  ;; 															      ;;
  ;; (convert-to-link "This is simple text")										      ;;
  ;; (convert-to-link "A doc link to [an example website: fast.ai](https://www.fast.ai/) should also work fine.")		      ;;
  ;; 															      ;;
  ;; 															      ;;
  ;; (defun get-till(sb str)												      ;;
  ;;   (substring str 0 (s-index-of sb str)))										      ;;
  ;; 															      ;;
  ;; (defun get-from (eb str)												      ;;
  ;;   (substring str (+ 1 (s-index-of eb str)) (length str)))								      ;;
  ;;   															      ;;
  ;; 															      ;;
  ;; (defun get-bracketted(sb eb str)											      ;;
  ;;   (substring str (+ 1 (s-index-of sb str))										      ;;
  ;; 	     (s-index-of eb str)))											      ;;
  ;; 															      ;;
  ;; (setq tstring "A doc link to [an example website: fast.ai](https://www.fast.ai/) should also work fine.")		      ;;
  ;; 															      ;;
  ;; (substring tstring (+ 1 (s-index-of ")" tstring)) (length tstring))							      ;;
  ;; 															      ;;
  ;; (get-till "[" "This is a text")											      ;;
  ;; (get-from ")" "This is a test")											      ;;
  ;; 															      ;;
  ;; (get-till "[" "A doc link to [an example website: fast.ai](https://www.fast.ai/) should also work fine.")		      ;;
  ;; 															      ;;
  ;; (get-bracketted "[" "]" "A doc link to [an example website: fast.ai](https://www.fast.ai/) should also work fine.")	      ;;
  ;; 															      ;;
  ;; (get-bracketted "(" ")" "A doc link to [an example website: fast.ai](https://www.fast.ai/) should also work fine.")	      ;;
  ;; 															      ;;
  ;; (let ((str "x is [xyz]"))												      ;;
  ;;   (substring str (+ 1 (s-index-of "[" str))										      ;;
  ;; 	     (s-index-of "]" str)))											      ;;
  ;; (s-index-of "[" "x is [x]")												      ;;
  ;; (s-index-of "]" "x is [x]")												      ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



  (defun jekyll-include-box (inc-tmpl inputtype text)
    (s-lex-format "{% include ${inc-tmpl} ${inputtype}=\"${text}\" %}"))


  (defun jekyll-include-remote-img (url caption)
    (if caption
	(s-lex-format "{% include image.html url='${url}' caption='${caption}' file='${url}' alt='${caption}' %}")
      (s-lex-format "{% include image.html url='${url}' file='${url}' alt='Image' %}")))


  (defun jekyll-include-local-img (url caption)
    (let ((n_url (s-lex-format "{{site.baseurl}}${url}")))
      (if caption
	  (s-lex-format "<figure>
      <img src=\"${n_url}\"
	   alt=\"${caption}\">
      <figcaption>${caption}</figcaption>
  </figure>")
	(s-lex-format "<figure>
      <img src=\"${n_url}\" >
  </figure>"))))


  (defun embed-img (url caption)
    (cond ((s-starts-with? "/images" url) (jekyll-include-local-img url caption))
	  ((s-starts-with? "/assets" url) (jekyll-include-local-img url caption))
	  (t (jekyll-include-remote-img url caption))))

  ;;(jekyll-include-img "/images/Emacs.png" "Emacs")

  (defun embed-iframe (url)
    (s-lex-format " <div style=\"text-align: center;\">
	<iframe width=\"560\" height=\"315\" src=\"${url}\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>
     </div>"))


  (defun get-yt-code (url)
    (car (s-split "&list=" (s-chop-prefixes '("https://www.youtube.com/watch?v=" "https://www.youtube.com/playlist?list=" "https://youtu.be/") url))))

  ;;(get-yt-code "https://www.youtube.com/watch?v=SmH3BPpl0TI")
  ;;(get-yt-code "https://www.youtube.com/playlist?list=PLxc79l2wpbJYTI5rv2os7OoKQMqxReZpr")
  ;;(get-yt-code "https://www.youtube.com/watch?v=SzA2YODtgK4&list=PLxc79l2wpbJYTI5rv2os7OoKQMqxReZpr")
  ;;(get-yt-code "https://youtu.be/VawlmG9tsXI")


  (defun embed-yt(url)
    (if (s-starts-with? "https://www.youtube.com/playlist?list=" url)
	(let ((code (get-yt-code url))
	      (embed-base "https://www.youtube.com/embed/videoseries?list="))
	  (embed-iframe (concat embed-base code)))
      (jekyll-include "youtube.html" (concat "https://youtu.be/" (get-yt-code url)))))

  ;;(embed-yt "https://www.youtube.com/watch?v=SmH3BPpl0TI")
  ;;(embed-yt "https://www.youtube.com/playlist?list=PLxc79l2wpbJYTI5rv2os7OoKQMqxReZpr")
  ;;(embed-yt "https://youtu.be/VawlmG9tsXI")

  (org-link-set-parameters
   "yt"
   :export (lambda (path desc backend)
	     (cond
	      ((eq 'html backend)
	       (embed-yt path ))))
   :help-echo "This links helps in exporting link to jekyll youtube liquid template")

  (org-link-set-parameters
   "twitter"
   :export (lambda (path desc backend)
	     (cond
	      ((eq 'html backend)
	       (jekyll-include "twitter.html" path ))))
   :help-echo "This links helps in exporting link to jekyll liquid twitter template")

  (org-link-set-parameters
   "img"
   :export (lambda (path desc backend)
	     (cond
	      ((eq 'html backend)
	       (embed-img  path desc))))
   :help-echo "This links helps in exporting link to jekyll liquid image template")

  (org-link-set-parameters
   "alert"
   :face '(:foreground "red" :underline t)
   :export (lambda (path desc backend)
	     (cond
	      ((eq 'html backend)
	       (jekyll-include-box "alert.html" "text" (or desc path)))))
   :help-echo "This links helps in exporting link to jekyll alert template")


  (org-link-set-parameters
   "info"
   :face '(:foreground "blue" :underline t)
   :export (lambda (path desc backend)
	     (cond
	      ((eq 'html backend)
	       (jekyll-include-box "info.html" "text" (or desc path)))))
   :help-echo "This links helps in exporting link to jekyll info template")


  (org-link-set-parameters
   "warning"
   :face '(:foreground "pink")
   :export (lambda (path desc backend)
	     (cond
	      ((eq 'html backend)
	       (jekyll-include-box "warning.html" "content" (or desc path)))))
   :help-echo "This links helps in exporting link to jekyll warning template")


  (org-link-set-parameters
   "important"
   :face '(:foreground "yellow")
   :export (lambda (path desc backend)
	     (cond
	      ((eq 'html backend)
	       (jekyll-include-box "important.html" "content" (or desc path)))))
   :help-echo "This links helps in exporting link to jekyll important template")

  (org-link-set-parameters
   "tip"
   :face '(:foreground "green")
   :export (lambda (path desc backend)
	     (cond
	      ((eq 'html backend)
	       (jekyll-include-box "tip.html" "content" (or desc path)))))
   :help-echo "This links helps in exporting link to jekyll tip template")


  (org-link-set-parameters
   "note"
   :face '(:foreground "light blue")
   :export (lambda (path desc backend)
	     (cond
	      ((eq 'html backend)
	       (jekyll-include-box "note.html" "content" (or desc path)))))
   :help-echo "This links helps in exporting link to jekyll note template")





(provide 'publish)



