(define-module (paulj packages paulj-dmenu)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (paulj packages))

(define-public paulj-dmenu
  (package
   (inherit dmenu)
   (name "paulj-dmenu")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/paul-jewell/paulj-dmenu.git")
           (branch "paulj")
           (commit "1a13d0465d1a6f4f74bc5b07b04c9bd542f20ba6")))
     (sha256
      (base32 "0gjjbh49j85rpbmiqj236g4c1zb1h8xh41mcjsvnzgwn72893mk6"))))
   (home-page "https://github.com/paul-jewell/paulj-dmenu.git")
   (synopsis "paulj version of dmenu")))
