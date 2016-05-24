#!/usr/local/bin/dash

origin="origin"

clone() {
    rm -rf $1
    git clone $origin $1
    cd $1
    git config user.name $1
    lg="log --graph --pretty=format:'%C(auto)%h %s %C(red)%an'"
    git config alias.lg "$lg"
    cd ..
}

(cd $origin && git config receive.denyCurrentBranch ignore)

clone alice
clone bob
