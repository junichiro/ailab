laude Code Global Development Style Configuration

## Development Process

### TDD (Test-Driven Development)
Following TDD principles advocated by t-wada:

1. **RED**: Write a failing test first
   - Tests should be specific and test one behavior
   - Test names should clearly describe what is being tested (in Japanese is acceptable)

2. **GREEN**: Write minimal code to pass the test
   - Fake implementation is acceptable initially
   - Avoid over-engineering

3. **REFACTOR**: Improve the code
   - Refactor while keeping tests green
   - Remove duplication following DRY principle

### Test Writing Style
```javascript
// Example: Jest/Vitest
describe('Calculator', () => {
  describe('add', () => {
    test('正の数同士の加算ができる', () => {
      expect(add(1, 2)).toBe(3);
    });
    
    test('負の数を含む加算ができる', () => {
      expect(add(-1, 2)).toBe(1);
    });
  });
});
```

## Coding Conventions

### Naming Rules
- **Variables & Functions**: camelCase
  - Use clear, intentional names
  - `getUserById` ✓ / `getUser` ✗
- **Constants**: UPPER_SNAKE_CASE
- **Classes & Types**: PascalCase
- **File Names**: 
  - Components: PascalCase (e.g., `UserProfile.tsx`)
  - Others: kebab-case (e.g., `api-client.ts`)

### Formatting
- **Empty lines**: Should not contain any spaces or indentation

### Function Design
- Follow Single Responsibility Principle
- Clearly separate pure functions from those with side effects
- Use early returns to reduce nesting

```javascript
// Good
function processUser(user) {
  if (!user) return null;
  if (!user.isActive) return null;
  
  return {
    ...user,
    processedAt: new Date()
  };
}

// Bad
function processUser(user) {
  if (user) {
    if (user.isActive) {
      return {
        ...user,
        processedAt: new Date()
      };
    }
  }
  return null;
}
```

## Error Handling

### Basic Policy
- Detect errors early and handle appropriately
- User-facing error messages should be helpful
- Developer-facing errors should be detailed

### Implementation Example
```typescript
class ApiError extends Error {
  constructor(
    message: string,
    public statusCode: number,
    public code: string
  ) {
    super(message);
    this.name = 'ApiError';
  }
}

// Usage
try {
  const data = await fetchUser(id);
} catch (error) {
  if (error instanceof ApiError) {
    logger.error('API Error', { 
      code: error.code, 
      statusCode: error.statusCode 
    });
    // Simple message for users
    showNotification('Failed to retrieve user information');
  }
  throw error;
}
```

## Development Priorities

1. **Correctness**: First, it must work correctly
2. **Readability**: Team members must understand it easily
3. **Maintainability**: Future changes should be easy
4. **Performance**: Optimize only when necessary

## Build Quality Standards

### Warning Resolution Policy
- **All warnings should be resolved**, even if they appear to have no immediate impact
- Warnings often indicate potential issues that may become problematic in the future
- Clean builds with zero warnings improve code quality and maintainability
- Warnings can mask important issues - keep the build output clean to spot real problems quickly

## Code Review Checklist

### Must Check
- [ ] Are tests written?
- [ ] Do tests clearly express intent?
- [ ] Is error handling appropriate?
- [ ] Are names appropriate and intentions clear?

### Recommendations
- [ ] Are functions within 10 lines?
- [ ] Is nesting within 3 levels?
- [ ] Is there no duplicated code?

## Git Commit Messages

### Format
```
<type>: <subject>

<body>

<footer>
```

### Type
- `feat`: New feature
- `fix`: Bug fix
- `refactor`: Refactoring
- `test`: Adding/modifying tests
- `docs`: Documentation only changes
- `style`: Changes that don't affect code meaning
- `chore`: Changes to build process or tools

### Example
```
feat: add user authentication

Implement JWT-based authentication:
- Login/logout API endpoints
- Token refresh functionality
- Authentication middleware

Closes #123
```

## Instructions for Claude Code

1. **Practice TDD**
   - Always write tests first when implementing new features
   - Confirm tests are RED before proceeding to implementation

2. **Incremental Implementation**
   - Don't try to write perfect code at once, improve incrementally
   - First make it work, then refactor

3. **Language Usage**
   - Write comments in Japanese
   - Write test case descriptions in Japanese
   - Use English for code itself

4. **Thorough Confirmation**
   - Confirm approach before making large changes
   - Follow existing code style when present

