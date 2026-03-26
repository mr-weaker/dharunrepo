# Security Guidance Plugin

A Claude Code plugin that provides real-time security warnings when editing files with potential security vulnerabilities.

## Overview

This plugin implements a **PreToolUse hook** that monitors file edits and warns about common security patterns that could lead to vulnerabilities.

## Features

The plugin monitors for 9 common security patterns:

1. **Command Injection** - `subprocess.call()`, `os.system()`
2. **Cross-Site Scripting (XSS)** - `.innerHTML =`, `dangerouslySetInnerHTML`
3. **Eval Usage** - `eval()` in JavaScript/Python
4. **Dangerous HTML** - `<script>` tags
5. **Pickle Deserialization** - `pickle.loads()`
6. **Shell Injection** - `shell=True` in subprocess calls
7. **SQL Injection patterns** (basic detection)
8. **Hardcoded credentials** (password/token in code)
9. **Insecure file operations**

## Installation

### Local Installation

Add to your project's `.claude/settings.json`:

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

## Usage

The plugin works automatically! When enabled:

1. Edit any file in your project
2. If Claude detects a security pattern, you'll receive a warning
3. The warning explains the risk and suggests alternatives

### Example

When you write:
```python
import os
user_input = get_user_input()
os.system(f"echo {user_input}")  # ⚠️ Warning triggered!
```

Claude will warn:
> ⚠️ **Security Warning**: Detected `os.system()` call which may be vulnerable to command injection. Consider using `subprocess.run()` with a list of arguments instead.

## Configuration

### Requirements
- Python 3.6 or higher
- Claude Code installed

### Settings

You can customize the plugin behavior in `.claude/settings.json`:

```json
{
  "pluginSettings": {
    "security-guidance": {
      "enabled": true,
      "autoInvoke": true,
      "strictMode": false,     // Future: More aggressive checking
      "ignorePatterns": []      // Future: Patterns to ignore
    }
  }
}
```

## How It Works

The plugin uses a **PreToolUse hook** which:
1. Intercepts file edit operations
2. Scans the content for security patterns using regex
3. Provides contextual warnings before the edit is applied
4. Allows you to proceed or modify your approach

## Detected Patterns

### Command Injection
```python
# ❌ Vulnerable
os.system("ls " + user_input)
subprocess.call("echo " + data, shell=True)

# ✅ Safe
subprocess.run(["ls", user_input])
```

### XSS (Cross-Site Scripting)
```javascript
// ❌ Vulnerable
element.innerHTML = userInput;
<div dangerouslySetInnerHTML={{__html: data}} />

// ✅ Safe
element.textContent = userInput;
<div>{sanitizedData}</div>
```

### Eval Usage
```javascript
// ❌ Vulnerable
eval(userCode);
new Function(userCode)();

// ✅ Safe
JSON.parse(userInput);
// Or use a safe expression parser
```

## Limitations

- **Pattern-based detection**: May have false positives/negatives
- **Not a replacement for security audits**: Use proper security tools
- **Language support**: Primarily Python and JavaScript
- **Context-aware**: May not understand complex security contexts

## Best Practices

1. **Don't ignore all warnings**: Each warning is there for a reason
2. **Review suggestions**: The plugin provides alternative approaches
3. **Use in development**: Catch issues early
4. **Combine with other tools**: Use alongside linters, SAST tools

## Development

### Hook Structure

The hook is defined in:
- `hooks/hooks.json` - Hook configuration
- `hooks/security_reminder_hook.py` - Hook implementation

### Adding New Patterns

Edit `security_reminder_hook.py`:

```python
SECURITY_PATTERNS = [
    {
        "pattern": r"your_pattern_here",
        "message": "Your warning message",
        "severity": "high|medium|low"
    }
]
```

## Contributing

Found a security pattern we should detect? 
1. Fork the repo
2. Add the pattern to `security_reminder_hook.py`
3. Test it thoroughly
4. Submit a PR

## License

MIT License - see LICENSE file for details

## Security Note

This plugin is a **development aid**, not a comprehensive security solution. Always:
- Perform proper security audits
- Use static analysis tools (Bandit, ESLint security plugins)
- Follow OWASP guidelines
- Have security reviews before production

## Support

- [Report Issues](https://github.com/dharunplugin/dharunrepo/issues)
- [Claude Code Documentation](https://code.claude.com/docs)
- [Anthropic Discord](https://anthropic.com/discord)
