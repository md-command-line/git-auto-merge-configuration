# Installation/Usage
```bash
git clone https://github.com/MichaelDimmitt/git-auto-merge-configuration.git;
```
```bash
cd git-auto-merge-configuration;
```
```bash
pathtofile=pwd; echo "alias automergeall='/.$($pathtofile)/write_all_branches_to_file_of_current_branch_name.sh'" >> ~/.bashrc; source ~/.bashrc;
```
#### next steps 
1) cd (into a project with multiple branches.)
2) type in terminal:  `automergeall`

# Configure your Base Branches with Dependant Branches
often when developing we have a base branch like "master"
<br>every branch typically should be up to date with master.

This is often never an issue if programmming with best practices.
<br>Lets imagine a quick fix is pushed onto master. 
<br>Conveniently this script allows automatic cherry-picking commits, updating dependant branches when the specified base branch changes.

# Things to watch out for... 
1) do not create circular dependencies between your branches.
2) there should be built a delete function that finds specific shared commit accross the dependent branches and allows deletion of code. --cherry picked to a storage branch location if they ever need to recover that information. The commit will put as the message the sha along with the origin branch that called for the deletion. The branch that will store these commits will be called: automergeconfiguration-backing-up-removed-commits
