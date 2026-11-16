(add-to-list 'default-frame-alist '(width . 220))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(left . 70))
(add-to-list 'default-frame-alist '(top . 40))

;;; Enable electric pair for relevant major modes.
(dolist (hook '(ess-r-mode-hook
                c-mode-hook
                c++-mode-hook
                julia-mode-hook
		python-mode-hook
                LaTeX-mode-hook))
  (add-hook hook #'electric-pair-local-mode))
