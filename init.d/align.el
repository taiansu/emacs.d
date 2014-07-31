(defun align-colons (begin end)
  "Align region to colon (:) signs"
  (interactive "r")
  (align-regexp begin end ".:\\(\\s-*\\)" 1 1 t))

(defun align-hash (begin end)
  "Align region to hash rockets"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)\=>\\(\\s-*\\)" 1 1 t))
