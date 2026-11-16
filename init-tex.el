(use-package tex
  :ensure auctex)

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))

(setq TeX-view-program-selection '((output-pdf "PDF Tools")))

(add-to-list 'TeX-view-program-list
             '("MuPDF" "mupdf %o"))

(add-hook 'LaTeX-mode-hook #'turn-on-reftex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)

(setq TeX-PDF-mode t)

;;; PDF on the right
(add-to-list 'display-buffer-alist
             '("\\.pdf\\'"
               (display-buffer-reuse-window
                display-buffer-in-side-window)
               (side . right)
               (window-width . 0.45)))

;;; Hide automatic compilation messages.
(setq TeX-show-compilation nil)
