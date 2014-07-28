(package-initialize)
(require 'cask "/usr/local/Cellar/cask/0.7.0/cask.el")
(cask-initialize)

(defun ts-require-package (name)
  (unless (package-installed-p name)
    (package-install name)))

