#!/usr/bin/env sh 

suckless_root="/home/paul/projects/guix/pj-suckless"
for repo in paulj-dmenu paulj-dwm paulj-slock paulj-st dwmblocks
    do 	
        git_hash=$(git -C ~/git/$repo log -n 1 --format=format:"%H") 	
        guix_hash=$(guix hash --hash=sha256 --format=nix-base32 -rx ~/git/$repo) 	
        echo $repo $git_hash $guix_hash 	
        sed -i "s/(commit \".\+\")/(commit \"$git_hash\")/g" $suckless_root/paulj/packages/$repo.scm 	
        sed -i "s/(base32 \".\+\")/(base32 \"$guix_hash\")/g" $suckless_root/paulj/packages/$repo.scm 
    done

