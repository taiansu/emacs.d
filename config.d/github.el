(require 'gist)
(setq gist-authenticate-function 'gist-basic-authentication)
(global-set-key (kbd "<f8>") 'gist-region-or-buffer)
