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
             (commit "5f04961cbd8f31ffae9fc7a96d25adabb45522b1")))
       (sha256
        (base32 "16xg8ywgglxdqw3hxqkyl5671i33vw9ql11k534r8dg9bq54yz33"))))
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
