# for each branch...

currbranch=`git branch | grep \* | cut -c 3-`; 
if [ -d .automerge_config ]; then
  if [ -f .automerge_config/$currbranch.txt ]; then
    for BRANCH in `cat .automerge_config/$currbranch.txt`;  do echo $BRANCH; done
  else 
    say "You must run automerge script for this branch"
  fi
else 
  say "You must run automerge script first"
fi

