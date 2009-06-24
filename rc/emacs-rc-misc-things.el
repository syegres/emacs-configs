;;; emacs-rc-misc-things.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet

;; misc variables
(setq auto-compression-mode t)
(setq text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
(setq user-full-name "Alex Ott")

(custom-set-variables
 '(delete-selection-mode t)
 '(fill-column 90)
 '(kill-whole-line t)
 '(tab-always-indent t)
 '(indent-tabs-mode nil)
 '(tab-width 8)
 '(next-line-add-newlines t))

;; unmark some function
(put 'upcase-region 'disabled nil)

;; set safe-local varaibles
(custom-set-variables
 '(safe-local-variable-values (quote (
                                      (c-file-offsets (substatement-open . 0))
                                      (prompt-to-byte-compile)
                                      (c-indentation-style . k&r)
                                      (indent-tabs-mode . 1)
                                      (folded-file . t)
                                      (TeX-open-quote . "<<")
                                      (TeX-close-quote . ">>")
                                      ))))

;; htmlize
(require 'htmlize)
(setq htmlize-output-type 'inline-css)
(defun alexott/add-google-analytics ()
  (while (search-forward "</body>" nil t)
    (replace-match "\n<script src=\"http://www.google-analytics.com/urchin.js\" type=\"text/javascript\">\n</script>\n<script type=\"text/javascript\">\n _uacct = \"UA-78697-3\";\n  urchinTracker();\n</script>\n</body>" nil t))
  )
(add-hook 'htmlize-after-hook 'alexott/add-google-analytics)

;; untabify
;; (defun untabify-file ()
;;   (save-excursion
;;     (delete-trailing-whitespace)
;;     (untabify (point-min) (point-max))))

;; footnote mode
(autoload 'footnote-mode "footnote" nil t)
;; (require 'footnote-init)
;; (defun my-fn-hook ()
;;  (footnote-init)
;;  )
;; (add-hook 'footnote-mode-hook 'my-fn-hook)

;; chm viewer
(require 'chm-view)

;;
(add-to-list 'auto-mode-alist '("\\.log$" . auto-revert-mode))

;;; emacs-rc-misc-things.el ends here

