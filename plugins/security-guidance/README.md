# Security Guidance Plugin

Security reminder hook that warns about potential security issues when editing files.

## Overview

This plugin monitors 9 critical security patterns including command injection, XSS, eval usage, dangerous HTML, pickle deserialization, and os.system calls.

## Installation

```bash
# Using Copilot CLI
copilot plugin install security-guidance@dharun
```

## Features

- **Real-time security warnings** when editing risky code
- **9 security patterns monitored:**
  - GitHub Actions workflow injection
  - Child process command injection  
  - Function evaluation (eval, new Function)
  - React XSS vulnerabilities (dangerouslySetInnerHTML)
  - DOM XSS (innerHTML, document.write)
  - Python pickle deserialization
  - OS system command injection
- Session-scoped warning state
- Educational security reminders

## How It Works

The plugin automatically activates when you edit files that match security patterns. When a potential vulnerability is detected, you'll see a warning with:

- Description of the security risk
- Recommended safe alternatives
- Links to security documentation

## Configuration

Disable security reminders if needed:

```bash
ENABLE_SECURITY_REMINDER=0
```

## License

MIT
