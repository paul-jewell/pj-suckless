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
           (commit "af3f2ca38afac123acce30952143e2f64f827830")))
     (sha256
      (base32 "1mwlfx7qfddffqj7pvchv38r49yldvv5388s87hgg0lck2ldzyfi"))))
   (home-page "https://github.com/paul-jewell/paulj-dwm.git")
   (synopsis "A version of dwm, configured by paulj")))
