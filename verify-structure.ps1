# Plugin Structure Verification Script
# This script checks if your Claude Code plugin repository is properly structured

Write-Host "`n🔍 Verifying Claude Code Plugin Structure...`n" -ForegroundColor Cyan

$errors = 0
$warnings = 0

# Check 1: Root files
Write-Host "📁 Checking root files..." -ForegroundColor Yellow
$requiredRootFiles = @("package.json", "README.md", "LICENSE", ".gitignore")
foreach ($file in $requiredRootFiles) {
    if (Test-Path $file) {
        Write-Host "  ✅ $file exists" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $file missing" -ForegroundColor Red
        $errors++
    }
}

# Check 2: Plugin directories
Write-Host "`n📦 Checking plugin directories..." -ForegroundColor Yellow
$plugins = @("code-review", "frontend-design", "security-guidance")
foreach ($plugin in $plugins) {
    $pluginPath = "plugins\$plugin"
    if (Test-Path $pluginPath) {
        Write-Host "  ✅ $plugin plugin folder exists" -ForegroundColor Green
        
        # Check for .claude-plugin/plugin.json
        $pluginJsonPath = "$pluginPath\.claude-plugin\plugin.json"
        if (Test-Path $pluginJsonPath) {
            Write-Host "    ✅ plugin.json exists at correct location" -ForegroundColor Green
            
            # Validate JSON
            try {
                $json = Get-Content $pluginJsonPath -Raw | ConvertFrom-Json
                if ($json.name -eq $plugin) {
                    Write-Host "    ✅ plugin.json has correct name: $($json.name)" -ForegroundColor Green
                } else {
                    Write-Host "    ⚠️  plugin.json name mismatch: expected '$plugin', got '$($json.name)'" -ForegroundColor Yellow
                    $warnings++
                }
            } catch {
                Write-Host "    ❌ plugin.json is invalid JSON" -ForegroundColor Red
                $errors++
            }
        } else {
            Write-Host "    ❌ plugin.json missing at $pluginJsonPath" -ForegroundColor Red
            $errors++
        }
        
        # Check for README
        $readmePath = "$pluginPath\README.md"
        if (Test-Path $readmePath) {
            Write-Host "    ✅ README.md exists" -ForegroundColor Green
        } else {
            Write-Host "    ⚠️  README.md missing (recommended)" -ForegroundColor Yellow
            $warnings++
        }
    } else {
        Write-Host "  ❌ $plugin plugin folder missing" -ForegroundColor Red
        $errors++
    }
}

# Check 3: Old/duplicate files
Write-Host "`n🧹 Checking for old/duplicate files..." -ForegroundColor Yellow
$oldPluginFolder = "plugins\.claude-plugin"
if (Test-Path $oldPluginFolder) {
    Write-Host "  ⚠️  Found old plugins/.claude-plugin folder (should be removed)" -ForegroundColor Yellow
    Write-Host "     Run cleanup commands from CLEANUP_TODO.md" -ForegroundColor Yellow
    $warnings++
} else {
    Write-Host "  ✅ No duplicate plugin folders found" -ForegroundColor Green
}

# Check 4: Settings example
Write-Host "`n⚙️  Checking configuration files..." -ForegroundColor Yellow
if (Test-Path "claude\settings.json") {
    Write-Host "  ✅ Example settings.json exists" -ForegroundColor Green
} else {
    Write-Host "  ⚠️  Example settings.json missing (optional)" -ForegroundColor Yellow
    $warnings++
}

# Summary
Write-Host "`n" + ("="*50) -ForegroundColor Cyan
Write-Host "📊 Verification Summary" -ForegroundColor Cyan
Write-Host ("="*50) -ForegroundColor Cyan

if ($errors -eq 0 -and $warnings -eq 0) {
    Write-Host "✅ All checks passed! Your plugin structure is correct." -ForegroundColor Green
    Write-Host "`n🚀 Next steps:" -ForegroundColor Cyan
    Write-Host "  1. Test plugins locally (see SETUP_GUIDE.md)" -ForegroundColor White
    Write-Host "  2. Push to GitHub" -ForegroundColor White
    Write-Host "  3. Share with others!" -ForegroundColor White
} elseif ($errors -eq 0) {
    Write-Host "⚠️  $warnings warning(s) found - structure is usable but could be improved" -ForegroundColor Yellow
} else {
    Write-Host "❌ $errors error(s) and $warnings warning(s) found" -ForegroundColor Red
    Write-Host "`nPlease fix the errors above before using the plugins." -ForegroundColor Red
}

Write-Host ""
