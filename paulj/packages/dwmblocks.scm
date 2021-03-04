(define-module (paulj packages dwmblocks)
  ;;  #:use-module (gnu packages suckless)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages xorg) 
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)   
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
             (commit "9a0ead84133c2b07a77065153d9f63a31c44d265")))
       (sha256
        (base32 "0yl15562vcy74q6ry30lilw6w36iw4x7aj9a64glxfq7qazrwyly"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f
       #:make-flags
       (list (string-append "CC=" ,(cc-for-target))
             (string-append "PREFIX=" %output))
       #:phases (modify-phases %standard-phases (delete 'configure)))) ;; No configure stage
    (inputs
     `(("libx11" ,libx11)
       ("libxft" ,libxft)))
    (home-page "https://github.com/paul-jewell/dwmblocks.git")
    (synopsis "Status bar manager for dwm")
    (description "dwmblocks is a status bar manager for dwm window manager.")
    (license license:isc)))
