# Nido - Homebrew tap

Homebrew tap for [Nido](https://github.com/Josepavese/nido): a local VM manager for AI agents. Create, run and reuse QEMU virtual
machines through the CLI, terminal dashboard or native MCP server.

[Quickstart](https://github.com/Josepavese/nido#press-start) · [MCP guide](https://github.com/Josepavese/nido/blob/main/docs/mcp.md)

```bash
brew install Josepavese/nido/nido
nido version
```

`qemu` is installed as a dependency. The formula is regenerated from the latest
Nido GitHub Release every 6 hours by `.github/workflows/update-formula.yml`
(template in `templates/nido.rb`), so it follows every release automatically.
