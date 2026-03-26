#!/bin/bash
# Plugin Structure Verification Script
# This script checks if your Claude Code plugin repository is properly structured

echo -e "\n🔍 Verifying Claude Code Plugin Structure...\n"

errors=0
warnings=0

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Check 1: Root files
echo -e "${YELLOW}📁 Checking root files...${NC}"
required_files=("package.json" "README.md" "LICENSE" ".gitignore")
for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo -e "  ${GREEN}✅ $file exists${NC}"
    else
        echo -e "  ${RED}❌ $file missing${NC}"
        ((errors++))
    fi
done

# Check 2: Plugin directories
echo -e "\n${YELLOW}📦 Checking plugin directories...${NC}"
plugins=("code-review" "frontend-design" "security-guidance")
for plugin in "${plugins[@]}"; do
    plugin_path="plugins/$plugin"
    if [ -d "$plugin_path" ]; then
        echo -e "  ${GREEN}✅ $plugin plugin folder exists${NC}"
        
        # Check for .claude-plugin/plugin.json
        plugin_json="$plugin_path/.claude-plugin/plugin.json"
        if [ -f "$plugin_json" ]; then
            echo -e "    ${GREEN}✅ plugin.json exists at correct location${NC}"
            
            # Validate JSON (basic check)
            if python3 -m json.tool "$plugin_json" >/dev/null 2>&1 || jq empty "$plugin_json" >/dev/null 2>&1; then
                echo -e "    ${GREEN}✅ plugin.json is valid JSON${NC}"
            else
                echo -e "    ${RED}❌ plugin.json is invalid JSON${NC}"
                ((errors++))
            fi
        else
            echo -e "    ${RED}❌ plugin.json missing at $plugin_json${NC}"
            ((errors++))
        fi
        
        # Check for README
        readme="$plugin_path/README.md"
        if [ -f "$readme" ]; then
            echo -e "    ${GREEN}✅ README.md exists${NC}"
        else
            echo -e "    ${YELLOW}⚠️  README.md missing (recommended)${NC}"
            ((warnings++))
        fi
    else
        echo -e "  ${RED}❌ $plugin plugin folder missing${NC}"
        ((errors++))
    fi
done

# Check 3: Old/duplicate files
echo -e "\n${YELLOW}🧹 Checking for old/duplicate files...${NC}"
old_plugin_folder="plugins/.claude-plugin"
if [ -d "$old_plugin_folder" ]; then
    echo -e "  ${YELLOW}⚠️  Found old plugins/.claude-plugin folder (should be removed)${NC}"
    echo -e "     Run cleanup commands from CLEANUP_TODO.md"
    ((warnings++))
else
    echo -e "  ${GREEN}✅ No duplicate plugin folders found${NC}"
fi

# Check 4: Settings example
echo -e "\n${YELLOW}⚙️  Checking configuration files...${NC}"
if [ -f "claude/settings.json" ]; then
    echo -e "  ${GREEN}✅ Example settings.json exists${NC}"
else
    echo -e "  ${YELLOW}⚠️  Example settings.json missing (optional)${NC}"
    ((warnings++))
fi

# Summary
echo -e "\n${CYAN}==================================================${NC}"
echo -e "${CYAN}📊 Verification Summary${NC}"
echo -e "${CYAN}==================================================${NC}"

if [ $errors -eq 0 ] && [ $warnings -eq 0 ]; then
    echo -e "${GREEN}✅ All checks passed! Your plugin structure is correct.${NC}"
    echo -e "\n${CYAN}🚀 Next steps:${NC}"
    echo -e "  1. Test plugins locally (see SETUP_GUIDE.md)"
    echo -e "  2. Push to GitHub"
    echo -e "  3. Share with others!"
elif [ $errors -eq 0 ]; then
    echo -e "${YELLOW}⚠️  $warnings warning(s) found - structure is usable but could be improved${NC}"
else
    echo -e "${RED}❌ $errors error(s) and $warnings warning(s) found${NC}"
    echo -e "\n${RED}Please fix the errors above before using the plugins.${NC}"
fi

echo ""
exit $errors
