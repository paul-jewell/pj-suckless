(define-module (paulj packages paulj-dwm)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (paulj packages))

(define-public paulj-dwm
  (package
   (inherit dwm)
   (name "paulj-dwm")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/paul-jewell/paulj-dwm.git")
           (commit "40497bfe5b511f2618d0ba3abb0f4992700bc2e8")))
     (sha256
      (base32 "0zpz94ifgdlh30dlylkcf0ahplzpzf6c0h869rxgxi2zlxw899nn"))))
   (home-page "https://github.com/paul-jewell/paulj-dwm.git")
   (synopsis "A version of dwm, configured by paulj")))
