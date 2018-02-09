# for each branch...

currbranch=`git branch | grep \* | cut -c 3-`; 
if [ ! -d $automerge_config ]; then
  mkdir .automerge_config;
fi
if [ -f .automerge_config/$currbranch.txt ]; then
  rm .automerge_config/$currbranch.txt; 
fi

for BRANCH in `git branch --list | cut -c 3-`; do echo $BRANCH >> ".automerge_config/$currbranch.txt"; echo ;  done;
