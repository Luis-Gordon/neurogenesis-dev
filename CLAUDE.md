# my-project

Web application — Express API + React frontend.

## CRITICAL Constraints
- **NEVER** commit secrets — use environment variables or `.env` files
- **NEVER** add inline styles — use the project's CSS framework
- **NEVER** push directly to `main` without passing CI
- **ALWAYS** run tests before committing
- **ALWAYS** deploy staging first, verify, then production

## Commands

| Command | Purpose |
|---------|---------|
| `npm run dev` | Start development server |
| `npm run build` | Production build |
| `npm run test` | Run test suite |
| `npm run lint` | Run linter |
| `npm run typecheck` | TypeScript type checking |

## Repository Structure

```text
my-project/
├── src/
│   ├── api/              # Express routes and middleware
│   ├── components/       # React components
│   ├── lib/              # Shared utilities
│   └── styles/           # CSS / design tokens
├── tests/                # Test files
├── public/               # Static assets
└── .claude/
    ├── rules/            # Domain-specific conventions
    ├── hooks/            # Safety hooks
    └── settings.json     # Shared permissions
```

## Documentation

| Document | Location |
|----------|----------|
| API reference | `docs/api.md` |
| Architecture | `docs/architecture.md` |
| Changelog | `CHANGELOG.md` |
