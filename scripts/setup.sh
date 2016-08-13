#!/usr/local/bin/dash

origin="origin"

clone() {
    rm -rf $1
    git clone $origin $1
    cd $1
    git config user.name $1
    lg="log --graph --pretty=format:'%C(auto)%h %s %C(red)%an'"
    git config alias.lg "$lg"
    git config alias.up '!f() {
    if ! stash_sha1=$(git stash create "autostash"); then
        echo Cannot autostash
        exit 1
    fi
    if [ -n $stash_sha1 ]; then
        echo Created autostash: $(git rev-parse --short $stash_sha1)
        git reset --hard
    fi
    git pull --rebase
    if [ -n $stash_sha1 ]; then
        if git stash apply $stash_sha1 2>&1 >/dev/null; then
            echo Applied autostash.
        else
            if ! git stash store -m "autostash" -q $stash_sha1; then
                echo Cannot store \$stash_sha1
                exit 1
            fi
            echo Applying autostash resulted in conflicts.
            echo Your changes are safe in the stash.
            echo You can run "git stash pop" or "git stash drop" at any time.
        fi
    fi
    }; f'
    cd ..
}

(cd $origin && git config receive.denyCurrentBranch ignore)

clone alice
clone bob
