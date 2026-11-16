;; (defun my-ess-r-layout ()
;;   (let ((buf (get-buffer "*R*")))
;;     (when buf
;;       (display-buffer-in-side-window
;;        buf '((side . right)
;;              (window-width . 0.55)
;; 	     (window-parameters . ((no-delete-other-windows . t))))))))


(defun my-ess-r-layout ()
  (display-buffer-in-side-window
   (current-buffer)
   '((side . right)
     (window-width . 0.45))))

(add-hook 'inferior-ess-r-mode-hook #'my-ess-r-layout)

(defun my-ess-r-start-httpgd ()
  "Configure lazy httpgd graphics for an ESS R session."
  (ess-command
   "options(device = function(...) {
       httpgd::hgd(...)
       httpgd::hgd_browse()
   })\n"))

(defun my-ess-r-browse-httpgd ()
  "Bring the current httpgd viewer to the front."
  (ess-command
   "if (httpgd::hgd_details()$active) httpgd::hgd_browse()\n"))

(add-hook 'ess-r-post-run-hook #'my-ess-r-start-httpgd)
(add-hook 'ess-post-run-hook #'my-ess-r-browse-httpgd)


(add-hook 'ess-r-post-run-hook #'my-ess-r-start-httpgd)

(defun my-insert-pipe ()
  (interactive)
  (insert " %>%"))

(with-eval-after-load 'ess-r-mode
  (define-key ess-r-mode-map (kbd "C-c p") #'my-insert-pipe)
  (define-key inferior-ess-r-mode-map
    (kbd "C-c p") #'my-insert-pipe))
