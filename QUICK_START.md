# 🚀 Quick Start Guide

## TL;DR - Get Your Plugins Working in 5 Minutes

### 1️⃣ Clean Up Old Files
```powershell
# Windows PowerShell
Remove-Item -Path "plugins\.claude-plugin" -Recurse -Force -ErrorAction SilentlyContinue
```

```bash
# Linux/macOS/Git Bash
rm -rf plugins/.claude-plugin
```

### 2️⃣ Verify Structure
```powershell
# Windows
.\verify-structure.ps1
```

```bash
# Linux/macOS
chmod +x verify-structure.sh && ./verify-structure.sh
```

Expected output: **✅ All checks passed!**

### 3️⃣ Install Claude Code

**Windows:**
```powershell
irm https://claude.ai/install.ps1 | iex
```

**macOS/Linux:**
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

**Alternative (Homebrew):**
```bash
brew install --cask claude-code
```

### 4️⃣ Create Test Project
```bash
mkdir test-project
cd test-project
mkdir .claude
```

Create `.claude/settings.json`:
```json
{
  "plugins": [
    {
      "name": "security-guidance",
      "path": "d:/dharunplugin/dharunrepo/plugins/security-guidance"
    }
  ],
  "pluginSettings": {
    "security-guidance": {
      "enabled": true,
      "autoInvoke": true
    }
  }
}
```

💡 **Tip**: Replace `d:/dharunplugin/dharunrepo` with your actual path!

### 5️⃣ Test Plugin
```bash
# Start Claude
claude

# In Claude, create a test file
> create a Python file with os.system()
```

**Expected**: Security warning should appear! 🎉

## ✅ What's Fixed

| Issue | Status | Fix |
|-------|--------|-----|
| Plugin structure wrong | ✅ Fixed | Moved `.claude-plugin/` inside each plugin folder |
| Missing package.json | ✅ Fixed | Created root `package.json` |
| No documentation | ✅ Fixed | Added README, SETUP_GUIDE, etc. |
| No verification | ✅ Fixed | Added verification scripts |

## 🎯 Available Plugins

### 1. Security Guidance (Recommended to Start)
- **Type**: Hook (auto-runs)
- **Test**: Create Python file with `os.system()`
- **Expected**: Security warning

### 2. Code Review
- **Type**: Command
- **Test**: `/code-review` in a PR
- **Requires**: GitHub CLI (`gh`)

### 3. Frontend Design
- **Type**: Skill (auto-invokes)
- **Test**: Edit HTML/React file
- **Expected**: Design guidance

## 📖 Full Documentation

- **Setup Details**: See `SETUP_GUIDE.md`
- **What Was Fixed**: See `FIXES_APPLIED.md`
- **Cleanup Tasks**: See `CLEANUP_TODO.md`
- **Main Docs**: See `README.md`

## 🆘 Troubleshooting

### "Plugin not found"
- Check path in `.claude/settings.json` is absolute
- Verify `.claude-plugin/plugin.json` exists in plugin folder

### "Command not recognized"
```bash
# Check Claude Code is installed
claude --version

# If not found, reinstall
irm https://claude.ai/install.ps1 | iex  # Windows
# OR
curl -fsSL https://claude.ai/install.sh | bash  # macOS/Linux
```

### "Plugin not loading"
```bash
# Check plugin structure
.\verify-structure.ps1  # Windows
./verify-structure.sh   # Linux/macOS

# Should see all ✅ checks pass
```

## 🔗 Important Links

- [Claude Code Docs](https://code.claude.com/docs)
- [Official Claude Code Repo](https://github.com/anthropics/claude-code)
- [Anthropic Discord](https://anthropic.com/discord)

## 💡 Pro Tips

1. **Start with one plugin** - Test security-guidance first
2. **Use absolute paths** - Full paths in settings.json for local testing
3. **Check logs** - Run with `CLAUDE_DEBUG=1 claude` for verbose output
4. **One at a time** - Enable plugins one by one to isolate issues

## 🎉 Success Checklist

- [ ] Old `plugins/.claude-plugin/` folder removed
- [ ] Verification script shows all ✅
- [ ] Claude Code installed and working
- [ ] Test project created with settings.json
- [ ] At least one plugin tested successfully
- [ ] Repository pushed to GitHub

---

**Ready to go!** If all checks pass, your plugins should work. 🚀

For detailed information, see the other documentation files in this repository.
