# Cleanup Tasks

## ⚠️ Old Files to Remove

The following folders contain duplicate/outdated plugin metadata and should be removed:

### 1. Remove old plugin.json files
```bash
# These are in the WRONG location (should be inside each plugin folder)
rm -rf plugins/.claude-plugin/
```

The old structure was:
```
plugins/
  .claude-plugin/           # ❌ Wrong location
    code-review.plugin.json
    frontend-design.plugin.json
    security-guidance.plugin.json
```

The NEW correct structure is:
```
plugins/
  code-review/
    .claude-plugin/         # ✅ Correct location
      plugin.json
  frontend-design/
    .claude-plugin/         # ✅ Correct location
      plugin.json
  security-guidance/
    .claude-plugin/         # ✅ Correct location
      plugin.json
```

### 2. Optional: Clean up testing directories

If `claude-plugin/` folder at root was just for testing, you can remove it:
```bash
rm -rf claude-plugin/
```

But keep it if you want to maintain a collection-level metadata file.

## ✅ Verification Commands

### Check plugin structure:
```powershell
# Windows PowerShell
Get-ChildItem -Path "plugins\*\.claude-plugin\plugin.json" -Recurse
```

```bash
# Linux/macOS/Git Bash
find plugins/ -name "plugin.json" -path "*/.claude-plugin/*"
```

Expected output:
```
plugins/code-review/.claude-plugin/plugin.json
plugins/frontend-design/.claude-plugin/plugin.json
plugins/security-guidance/.claude-plugin/plugin.json
```

### Check for duplicate/old files:
```powershell
# Should return nothing (or the files to be deleted)
Get-ChildItem -Path "plugins\.claude-plugin\" -ErrorAction SilentlyContinue
```

## 🧹 Cleanup Commands

### Windows PowerShell
```powershell
# Remove old plugin folder
if (Test-Path "plugins\.claude-plugin") {
    Remove-Item -Path "plugins\.claude-plugin" -Recurse -Force
    Write-Host "✅ Removed old plugins/.claude-plugin folder"
}

# Optional: Remove claude-plugin at root (if not needed)
if (Test-Path "claude-plugin") {
    Remove-Item -Path "claude-plugin" -Recurse -Force
    Write-Host "✅ Removed claude-plugin folder"
}

Write-Host "✅ Cleanup complete!"
```

### Linux/macOS/Git Bash
```bash
# Remove old plugin folder
if [ -d "plugins/.claude-plugin" ]; then
    rm -rf "plugins/.claude-plugin"
    echo "✅ Removed old plugins/.claude-plugin folder"
fi

# Optional: Remove claude-plugin at root (if not needed)
if [ -d "claude-plugin" ]; then
    rm -rf "claude-plugin"
    echo "✅ Removed claude-plugin folder"
fi

echo "✅ Cleanup complete!"
```

## 📋 After Cleanup

1. Run verification commands to confirm only new plugin.json files exist
2. Test plugins with Claude Code
3. Commit changes:
   ```bash
   git add .
   git commit -m "fix: correct plugin structure and remove duplicates"
   git push origin main
   ```

## ❓ Keep or Remove?

### Keep These:
- ✅ `plugins/*/. claude-plugin/plugin.json` - Required for each plugin
- ✅ `claude/settings.json` - Example configuration
- ✅ `package.json` - Repository metadata
- ✅ All README files

### Remove These:
- ❌ `plugins/.claude-plugin/` - Duplicate/wrong location
- ❓ `claude-plugin/plugin.json` - Optional (collection metadata, not required)

## 🎯 Final Structure

After cleanup:
```
dharunrepo/
├── .git/
├── .gitignore
├── LICENSE
├── README.md
├── SETUP_GUIDE.md
├── CLEANUP_TODO.md (this file - can delete after cleanup)
├── package.json
├── claude/
│   └── settings.json
└── plugins/
    ├── README.md
    ├── code-review/
    │   ├── .claude-plugin/
    │   │   └── plugin.json      ✅
    │   ├── commands/
    │   └── README.md
    ├── frontend-design/
    │   ├── .claude-plugin/
    │   │   └── plugin.json      ✅
    │   ├── skills/
    │   └── README.md
    └── security-guidance/
        ├── .claude-plugin/
        │   └── plugin.json      ✅
        ├── hooks/
        └── README.md
```
