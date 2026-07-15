(setq eglot-server-programs '((c++-mode . ("clangd"))))
(add-hook 'c++-mode-hook #'eglot-ensure)
