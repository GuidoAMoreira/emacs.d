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

;;; Load configuration modules

(load (expand-file-name "init-ui.el" user-emacs-directory))
(load (expand-file-name "init-r.el" user-emacs-directory))
(load (expand-file-name "init-julia.el" user-emacs-directory))
(load (expand-file-name "init-cpp.el" user-emacs-directory))
