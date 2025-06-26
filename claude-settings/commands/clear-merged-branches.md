# Git Branch Cleanup Command

## Instructions

Please perform the following Git cleanup tasks in order:

- **Delete merged local branches**: Remove all local branches that have been merged into the main branch (excluding the current branch and main/master)
- **Delete merged remote branches**: Remove all remote tracking branches that have been merged and no longer exist on the remote repository
- **Prune remote references**: Run `git fetch origin --prune` to clean up stale remote-tracking references

## Expected Actions

1. Identify and delete local branches that have been merged
2. Clean up remote tracking branches for deleted remote branches
3. Synchronize with remote repository and prune outdated references

## Safety Notes

- Preserve the current working branch and main/master branches
- Only delete branches that have been successfully merged
- Confirm remote branch deletion before proceeding if uncertain

