#!/usr/local/bin/dash

origin="origin"

clone() {
    rm -rf $1
    git clone $origin $1
    cd $1
    git config user.name $1
    lg="log --graph --pretty=format:'%C(auto)%h %s %C(red)%an'"
    git config alias.lg "$lg"
    git config alias.up '!sha1=$(git stash create "autostash"); [ -n "$sha1" ] && git reset --hard; git pull --rebase; [ -n "$sha1" ] && git stash apply "$sha1" && git gc --auto;'
    cd ..
}

(cd $origin && git config receive.denyCurrentBranch ignore)

clone alice
clone bob
