(define-module (paulj packages dwmblocks)
  ;;  #:use-module (gnu packages suckless)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix packages)
  #:use-module (paulj packages))

(define-public dwmblocks
  (package
    (name "dwmblocks")
    (version "6.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/paul-jewell/dwmblocks.git")
             (commit "747067e64e64c2723c5a71f518498c2162195d45")))
       (sha256
        (base32 "05ixpad1xh3nmcm5vfkv0x04jys56wwqsgiy41pbd6ga5d5jq88y"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "PREFIX=" %output))
       #:phases (modify-phases %standard-phases (delete 'configure)))) ;; No configure stage
    (home-page "https://github.com/paul-jewell/dwmblocks.git")
    (synopsis "Status bar manager for dwm")
    (description "dwmblocks is a status bar manager for dwm window manager.")
    (license license:isc)))
