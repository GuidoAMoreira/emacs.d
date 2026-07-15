;;; =========================
;;; Julia setup (modern)
;;; =========================

(use-package julia-mode
  :ensure t)

;; Tree-sitter Julia mode (modern)
(use-package julia-ts-mode
  :mode "\\.jl\\'")

;; LSP backend
;;(use-package eglot
;;  :hook (julia-ts-mode . eglot-ensure))
(add-hook 'julia-ts-mode-hook #'eglot-ensure)
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(julia-ts-mode . ("julia" "-e"
                 "using LanguageServer, LanguageServer.SymbolServer; runserver()"))))

;; Autocomplete UI
(use-package company
  :hook (after-init . global-company-mode))

;;; =========================
;;; REPL (optional, simple)
;;; =========================

(setq inferior-julia-program-name "/home/anthorg/.juliaup/bin/julia")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ess vterm julia-snail julia-ts-mode julia-repl eglot-jl company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setenv "PATH"
        (concat (getenv "HOME") "/.juliaup/bin:"
                (getenv "PATH")))
(setq exec-path (append '("~/.juliaup/bin") exec-path))

(defun my/julia-send-region (start end)
  "Send region to Julia REPL."
  (interactive "r")
  (let ((proc (get-process "shell")))
    (comint-send-region proc start end)
    (comint-send-string proc "\n")))

(use-package julia-snail
  :ensure t
  :hook (julia-ts-mode . julia-snail-mode))

(setq julia-snail-extra-args '("-t" "auto"))
