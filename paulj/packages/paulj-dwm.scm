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
           (commit "8d1e9184dfab7cedfe0196e49151c882580e9684")))
     (sha256
      (base32 "1izg774kkd17w7b3mlcr676427aw6ns228zfw2ay2l7k59j5cyna"))))
   (home-page "https://github.com/paul-jewell/paulj-dwm.git")
   (synopsis "A version of dwm, configured by paulj")))
