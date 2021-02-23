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
           (commit "8d55a04c95b8d7dc9b565bf835de1ec04f727727")))
     (sha256
      (base32 "1k8y1rl0ndwhqf42hdw7fl53fbhfx1z613blpk1qsh12b9wkin4d"))))
   (home-page "https://github.com/paul-jewell/paulj-dwm.git")
   (synopsis "A version of dwm, configured by paulj")))
