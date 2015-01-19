;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(setq backup-directory-alist
      (list (cons "." (expand-file-name "backup" user-emacs-directory))))
