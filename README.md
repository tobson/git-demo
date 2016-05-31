Demonstrate a pre-commit hook that prohibits merging the remote-tracking
branch into the local working branch.

To use the hook, do
~~~~
rsync hooks/ .git/hooks/
~~~~
and make sure that .git/hooks/prepare-commit-msg is executable.

