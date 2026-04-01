# neurogenesis-dev

Companion repo for the [Structured AI Workflow](https://neurogenesis.dev/blog/series/structured-ai-workflow/) blog series on [neurogenesis.dev](https://neurogenesis.dev).

This repo also hosts [GitHub Discussions](https://github.com/Luis-Gordon/neurogenesis-dev/discussions) for the [Giscus](https://giscus.app) comment system on the blog.

## What's Here

Working example configs for structuring AI-assisted development with Claude Code. Each directory corresponds to a post in the series:

| Post | Title | Status |
|------|-------|--------|
| 1 | [The Foundation That Changes Everything](https://neurogenesis.dev/blog/structured-ai-workflow-01-foundation/) | Published |
| 2 | Building Your Project's Memory | Planned |
| 3 | Session Memory: The Biggest Multiplier | Planned |
| 4 | Stop Coding Without a Plan | Planned |
| 5 | Three AIs Are Better Than One | Planned |
| 6 | Plugins, MCPs, and What's Next | Planned |

## Getting Started

Clone this repo and copy the files into your own project:

```bash
git clone https://github.com/Luis-Gordon/neurogenesis-dev.git
cp -r neurogenesis-dev/.claude your-project/.claude
cp neurogenesis-dev/CLAUDE.md your-project/CLAUDE.md
```

Then customize `CLAUDE.md` and the rule files for your project's stack and conventions.

## Structure

```text
.claude/
├── rules/          # Glob-scoped domain conventions
├── hooks/          # Safety and optimization hooks
└── settings.json   # Shared project permissions

CLAUDE.md           # Root AI instructions
.gitignore          # Standard patterns for Claude Code projects
```

## License

MIT
