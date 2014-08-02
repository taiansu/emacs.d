; Taian Su's Emacs 24 Configuration

;; Directories and file names
(setq ts-emacs-init-file (or load-file-name buffer-file-name))
(setq ts-emacs-config-dir
      (file-name-directory ts-emacs-init-file))
(setq user-emacs-directory ts-emacs-config-dir)
(setq ts-elisp-dir (expand-file-name "elisp" ts-emacs-config-dir))
(setq ts-elisp-external-dir
      (expand-file-name "external" ts-elisp-dir))
(setq ts-config-dir
      (expand-file-name "config.d" ts-emacs-config-dir))

;; Load all elisp files in ./config.d
(if (file-exists-p ts-config-dir)
    (dolist (file (directory-files ts-config-dir t "\\.el$"))
      (load file)))

;; Set up 'custom' system
(setq custom-file (expand-file-name "emacs-customizations.el" ts-emacs-config-dir))
(load custom-file)

;; =============================================================================
