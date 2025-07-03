# GitHub Issue Analysis and Complete Fix Workflow

Please analyze and fix the GitHub issue: $ARGUMENTS.

Follow these comprehensive steps to complete the entire workflow from issue analysis to cleanup:

## Initial Setup and Analysis
1. Use `gh issue view` to get the detailed issue information
2. Thoroughly understand the problem described in the issue
3. Search the codebase for relevant files and understand the current implementation
4. Create a new feature branch from main to implement the fix

## Implementation Phase
5. Implement the necessary changes to fix the issue
6. Ensure the code passes all linting and type checking requirements
7. Create a descriptive and meaningful commit message

## Testing and Verification
8. Check you can build the code
9. **Perform comprehensive testing** to verify the fix works correctly:
   - Run unit tests if available
   - Perform manual testing of the fixed functionality
   - Verify that the fix addresses the original issue completely
   - Ensure no regressions are introduced

## Initial PR Creation
10. Only after testing passes, push the changes and create a Pull Request
11. Include a detailed PR description explaining:
    - What issue was fixed
    - How it was fixed
    - What testing was performed

## Review Process Management
12. **Wait 5 minutes** for other team members to provide initial reviews
13. After the 5-minute wait period, check the PR for any review comments using `gh pr view`
14. **Address all review feedback**:
    - Read each comment carefully
    - Implement requested changes
    - Respond to questions or clarifications
    - Update code based on suggestions

## Post-Review Testing and Finalization
15. **Perform testing again** after addressing review comments:
    - Re-run all previous tests
    - Verify that review feedback has been properly addressed
    - Ensure the fix still works as expected
16. Once testing passes, commit the review-related changes with an appropriate commit message
17. Push the updated changes to the PR branch

## Merge and Cleanup
18. **Merge the PR to main** using `gh pr merge` (use appropriate merge strategy)
19. **Clean up branches thoroughly**:
    - Switch back to main branch: `git checkout main`
    - Pull latest changes: `git pull origin main`
    - Delete local feature branch: `git branch -d <branch-name>`
    - Delete remote feature branch: `git push origin --delete <branch-name>`
    - Prune remote tracking branches: `git fetch origin --prune`
    - Verify cleanup is complete

## Important Notes
- Always use the GitHub CLI (`gh`) for all GitHub-related operations
- Ensure each testing phase is thorough before proceeding, and confirm to be able to build
- Do not skip the review waiting period - collaboration is important
- Address ALL review comments before proceeding to merge
- Complete cleanup is essential to maintain a clean repository state
- If any step fails, investigate and resolve the issue before continuing

