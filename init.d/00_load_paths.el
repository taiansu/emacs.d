;; Add my personal elisp directory to load path
(add-to-list 'load-path ts-elisp-dir)

; Add external projects to load path
(dolist (project (directory-files ts-elisp-external-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))


;; Add personal theme path
(add-to-list 'custom-theme-load-path ts-themes-dir)
