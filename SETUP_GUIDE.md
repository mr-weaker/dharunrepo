# Setup Guide for Dharun Claude Plugins

## What You're Building

This repository contains **Claude Code plugins** (not VS Code extensions). 

### Key Differences:
- **Claude Code** = Terminal/CLI AI coding tool by Anthropic
- **VS Code Extensions** = Editor plugins for Visual Studio Code
- **GitHub Copilot** = Different AI assistant integrated into VS Code

## Quick Start

### 1. Install Claude Code

Choose your platform:

**macOS/Linux:**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Windows (PowerShell):**
```powershell
irm https://claude.ai/install.ps1 | iex
```

**Homebrew:**
```bash
brew install --cask claude-code
```

### 2. Verify Installation

```bash
claude --version
```

### 3. Using Your Plugins

#### Option A: Local Testing (Recommended for Development)

1. Navigate to a project directory:
   ```bash
   cd your-project
   ```

2. Create `.claude/settings.json`:
   ```bash
   mkdir .claude
   ```

3. Add this configuration to `.claude/settings.json`:
   ```json
   {
     "plugins": [
       {
         "name": "code-review",
         "path": "d:/dharunplugin/dharunrepo/plugins/code-review"
       },
       {
         "name": "frontend-design",
         "path": "d:/dharunplugin/dharunrepo/plugins/frontend-design"
       },
       {
         "name": "security-guidance",
         "path": "d:/dharunplugin/dharunrepo/plugins/security-guidance"
       }
     ],
     "pluginSettings": {
       "code-review": {
         "enabled": true
       },
       "frontend-design": {
         "enabled": true,
         "autoInvoke": true
       },
       "security-guidance": {
         "enabled": true,
         "autoInvoke": true
       }
     }
   }
   ```

4. Run Claude:
   ```bash
   claude
   ```

5. Test your plugins:
   ```bash
   /code-review  # Test the code review command
   ```

#### Option B: Publishing to GitHub (For Distribution)

1. Push your repo to GitHub:
   ```bash
   git add .
   git commit -m "Initial plugin setup"
   git push origin main
   ```

2. Users can install your plugins:
   ```bash
   copilot plugin marketplace add dharunplugin/dharunrepo
   copilot plugin install code-review@dharunplugin
   ```

## Testing Your Changes

### For Each Plugin:

1. **Code Review Plugin:**
   ```bash
   cd your-test-project
   claude
   # In Claude prompt:
   /code-review
   ```

2. **Frontend Design Plugin:**
   - Create or edit a frontend file (e.g., `index.html`, `App.tsx`)
   - The skill should auto-invoke when working on frontend code

3. **Security Guidance Plugin:**
   - Edit a file with potential security issues
   - The hook should warn you automatically

## Troubleshooting

### Plugin Not Found
- Check that `.claude/settings.json` has the correct absolute path
- Ensure each plugin has `.claude-plugin/plugin.json` inside its folder

### Plugin Not Loading
- Run `claude` with debug mode:
  ```bash
  CLAUDE_DEBUG=1 claude
  ```

### Command Not Working
- Verify the command file exists in `plugins/plugin-name/commands/`
- Check plugin.json has the command listed

## Directory Structure

Your repo should now look like this:

```
dharunrepo/
├── .gitignore
├── LICENSE
├── README.md
├── SETUP_GUIDE.md
├── package.json
├── claude/
│   └── settings.json          # Example configuration
├── claude-plugin/
│   └── plugin.json            # Collection metadata
└── plugins/
    ├── README.md
    ├── code-review/
    │   ├── .claude-plugin/
    │   │   └── plugin.json    # ✅ Correct location
    │   ├── commands/
    │   │   └── code-review.md
    │   └── README.md
    ├── frontend-design/
    │   ├── .claude-plugin/
    │   │   └── plugin.json    # ✅ Correct location
    │   ├── skills/
    │   │   └── frontend-design/
    │   │       └── SKILL.md
    │   └── README.md
    └── security-guidance/
        ├── .claude-plugin/
        │   └── plugin.json    # ✅ Correct location
        ├── hooks/
        │   ├── hooks.json
        │   └── security_reminder_hook.py
        └── README.md (create this)
```

## Next Steps

1. ✅ Repository structure is now correct
2. 🧪 Test each plugin locally
3. 📝 Add more detailed documentation to each plugin's README
4. 🚀 Push to GitHub and share with others

## Need Help?

- [Claude Code Documentation](https://code.claude.com/docs)
- [Anthropic Discord](https://anthropic.com/discord)
- [GitHub Issues](https://github.com/dharunplugin/dharunrepo/issues)

## Common Mistakes to Avoid

❌ **Don't confuse with VS Code extensions** - These are Claude Code plugins
❌ **Don't put plugin.json in root** - It must be in `.claude-plugin/` folder inside each plugin
❌ **Don't forget settings.json** - Each project needs `.claude/settings.json` to load plugins
✅ **Do test locally first** - Use absolute paths in settings.json for testing
✅ **Do follow the folder structure** - Match the official Claude Code plugin structure
