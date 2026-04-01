---
globs: "**/*.ts,**/*.tsx"
---

- TypeScript strict mode — no `any` (use `unknown` + narrowing)
- Type-only imports: `import type { Foo }` for types not used at runtime
- Named exports only (no default exports except page routes)
- Prefer interfaces for object shapes, types for unions and intersections
- Switch on union types must have exhaustive `default: never` check
- Async functions must have explicit return types
- Avoid type assertions (`as`) — prefer type guards or narrowing
