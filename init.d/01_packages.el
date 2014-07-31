(package-initialize)
(require 'cask "/usr/local/Cellar/cask/0.7.0/cask.el")
(cask-initialize)
(setq cask-base-path "~/.emacs.d/.cask/24.4.50.1/elpa/")

(defun ts-require-package (name)
  (unless (package-installed-p name)
    (package-install name)))

