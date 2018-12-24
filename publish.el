#!/usr/bin/emacs --script

(require 'org)
(require 'ox)
(require 'ox-publish)

;; No timestamps. Force it to republish everyhing every time. The timstamp-based
;; cache is just too dumb to use.
(setq org-publish-use-timestamps-flag nil)

;; Assumes orgfiles are in $HOME/org-files and publishes to $HOME/public_html.
;; That's just my current workflow. The base and target directory will 
;; base-directory will become a config and/or shell script argument (haven't
;; decided yet).
(setq org-publish-project-alist
      '(
        ("org-notes"
         :base-directory "~/org-files/"
         :base-extension "org\\|txt"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
         )
        ("org-static"
         :base-directory "~/org-site/org-files/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|md"
         :publishing-directory "~/org-site/public_html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))
        ))

