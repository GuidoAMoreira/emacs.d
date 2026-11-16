;;; =========================
;;; Package system setup
;;; =========================

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)

(package-initialize)

;; Ensure use-package exists
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; Show line numbers
(global-display-line-numbers-mode 1)

;;; Load configuration modules

(load (expand-file-name "init-ui.el" user-emacs-directory))
(load (expand-file-name "init-r.el" user-emacs-directory))
(load (expand-file-name "init-julia.el" user-emacs-directory))
(load (expand-file-name "init-cpp.el" user-emacs-directory))
(load (expand-file-name "init-tex.el" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(websocket pdf-tools auctex ess vterm julia-snail julia-ts-mode julia-repl eglot-jl company))
 ;; '(package-vc-selected-packages
 ;;   '((ess-unigd :vc-backend Git :url "https://github.com/sje30/ess-unigd.git"))))
 ;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-auto-revert-mode 1)
