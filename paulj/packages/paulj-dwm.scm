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
           (url "https://github.com/paulj/paulj-dwm.git")
           (commit "")))
     (sha256
      (base32 ""))))
   (home-page "https://github.com/pauljewell/paulj-dwm")
   (synopsys "paulj version of dwm")))
