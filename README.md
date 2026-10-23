# Nido — Homebrew tap

Homebrew tap for [Nido](https://github.com/Josepavese/nido): fast, local
QEMU/KVM VM sandboxes for AI agents, with a native MCP server.

```bash
brew install Josepavese/nido/nido
nido version
```

`qemu` is installed as a dependency. The formula is regenerated from the latest
Nido GitHub Release every 6 hours by `.github/workflows/update-formula.yml`
(template in `templates/nido.rb`), so it follows every release automatically.
