;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "essgd" "20240929.2107"
  "Show R plots from ESS within a buffer."
  '((websocket "1.15")
    (ess       "24.01.1")
    (emacs     "29.1"))
  :url "https://github.com/sje30/essgd"
  :commit "d9a3729ebaeeeec78984f00508cf2785bc7e8978"
  :revdesc "d9a3729ebaee"
  :authors '(("Stephen Eglen" . "sje30@cam.ac.uk"))
  :maintainers '(("Stephen Eglen" . "sje30@cam.ac.uk")))
