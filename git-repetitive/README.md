# Git Repetitive
This folder contains bash scripts to automate repetitive git tasks, such as clone multiple repos, change files content based on string replacement for multiple repos.

## clone-repos.sh
Usage:
```
    ./clone-repos.sh <input-filename> <target-folder>
```
 - `input-filename`. Text file containing the name of the repositories to clone (one per line).
 - `target-folder`. The parent folder where the repos will be cloned.
 
    This script will help you clone multiples repositories from the same user
 
 **Note: Add appropriate settings for script (GitHub username).

## push-changes.sh
Usage:
```
    ./push-changes.sh <input-filename> <folder> <commit-branch>
```

 - `input-filename`. Text file containing the name of the repos where the changes will be made.
 - `folder`. The parent folder where the repos are allocated.
 - `commit-branch`. The branch where the changes will be pushed to (it will be created from develop if doesn't exist).
 
    This script will use `sed` command based string replacement on the configured** files on the specified branch and will commit and push the changes.
    
  **Note: Add appropriate settings for desired changes.