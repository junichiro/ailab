# GitHub Issue Analysis and Complete Fix Workflow

Please analyze and fix the GitHub issue: $ARGUMENTS.

Follow these comprehensive steps to complete the entire workflow from issue analysis to cleanup:

## Initial Setup and Analysis
1. Use `gh issue view` to get the detailed issue information
2. Thoroughly understand the problem described in the issue
3. Search the codebase for relevant files and understand the current implementation
4. Create a new feature branch from main to implement the fix

## TDD Implementation Process (t-wada style)
5. **RED**: Write failing tests first
   - Create specific tests that describe the expected behavior
   - Test names should clearly describe what is being tested (Japanese is acceptable)
   - Ensure tests fail before implementation (RED state)
   - Tests should be focused on one behavior each

6. **GREEN**: Write minimal code to pass the test
   - Implement only what's needed to make tests pass
   - Fake implementation is acceptable initially
   - Avoid over-engineering at this stage

7. **REFACTOR**: Improve the code while keeping tests green
   - Remove duplication following DRY principle
   - Improve code structure and readability
   - Ensure all tests remain passing during refactoring

## Implementation Phase
8. Complete the implementation following TDD cycles
9. Ensure the code passes all linting and type checking requirements
10. Create a descriptive and meaningful commit message

## Testing and Verification
11. Check you can build the code
12. **Perform comprehensive testing** to verify the fix works correctly:
    - Run unit tests if available
    - Perform manual testing of the fixed functionality
    - Verify that the fix addresses the original issue completely
    - Ensure no regressions are introduced

## Initial PR Creation
13. Only after testing passes, push the changes and create a Pull Request
14. Include a detailed PR description explaining:
    - What issue was fixed
    - How it was fixed
    - What testing was performed

## Review Process Management
15. **Wait 5 minutes** for other team members to provide initial reviews
16. After the 5-minute wait period, check the PR for any review comments using `gh pr view`
17. **Address all review feedback**:
    - Read each comment carefully
    - Implement requested changes
    - Respond to questions or clarifications
    - Update code based on suggestions

## Post-Review Testing and Finalization
18. **Perform testing again** after addressing review comments:
    - Re-run all previous tests
    - Verify that review feedback has been properly addressed
    - Ensure the fix still works as expected
19. Once testing passes, commit the review-related changes with an appropriate commit message
20. Push the updated changes to the PR branch

## Merge and Cleanup
21. **Merge the PR to main** using `gh pr merge` (use appropriate merge strategy)
22. **Clean up branches thoroughly**:
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

