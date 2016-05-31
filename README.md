Demonstrate a pre-commit hook that prohibits merging the remote-tracking
branch into the local working branch.

To use the hook, do
~~~~
cp hooks/prepare-commit-msg .git/hooks/
~~~~
or
~~~~
cp hooks/prepare-commit-msg-2 .git/hooks/
~~~~

and make sure that .git/hooks/prepare-commit-msg is executable.

