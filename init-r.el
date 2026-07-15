(defun my-ess-r-layout ()
  (let ((buf (get-buffer "*R*")))
    (when buf
      (display-buffer-in-side-window
       buf '((side . right)
             (window-width . 0.45))))))

(add-hook 'inferior-ess-r-mode-hook #'my-ess-r-layout)

(defun my-insert-pipe ()
  (interactive)
  (insert " %>%"))

(with-eval-after-load 'ess-r-mode
  (define-key ess-r-mode-map (kbd "C-c p") #'my-insert-pipe))
