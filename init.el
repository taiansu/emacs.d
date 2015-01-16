; taiansu's Emacs 24 Configuration

;; Directories and file names
(setq ts-emacs-init-file (or load-file-name buffer-file-name))
(setq ts-emacs-config-dir
      (file-name-directory ts-emacs-init-file))
(setq user-emacs-directory ts-emacs-config-dir)
(setq ts-elisp-dir (expand-file-name "elisp" ts-emacs-config-dir))
(setq ts-elisp-external-dir
      (expand-file-name "external" ts-elisp-dir))
(setq ts-themes-dir
      (expand-file-name "themes" ts-elisp-dir))
(setq ts-init-dir
      (expand-file-name "init.d" ts-emacs-config-dir))

;; This line MUST come before Org is loaded
(setq org-replace-disputed-keys t)

;; Set up 'custom' system
(setq custom-file (expand-file-name "emacs-customizations.el" ts-emacs-config-dir))
(load custom-file)

;; Load all elisp files in ./init.d
(if (file-exists-p ts-init-dir)
    (dolist (file (directory-files ts-init-dir t "\\.el$"))
      (load file)))

;; =============================================================================
