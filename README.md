# Dharun GitHub Copilot Plugins

A collection of GitHub Copilot plugins for code review, frontend design, and security guidance.

## 📦 Plugins Included

### 1. **Code Review** (`code-review/`)
Automated pull request review using multiple specialized agents with confidence-based scoring.

### 2. **Frontend Design** (`frontend-design/`)
Create distinctive, production-grade frontend interfaces that avoid generic AI aesthetics.

### 3. **Security Guidance** (`security-guidance/`)
Security reminder hook that warns about potential security issues when editing files.

## 🚀 Installation

Using Copilot CLI:

```bash
# Install individual plugin (if published to a marketplace)
copilot plugin install code-review@dharun
copilot plugin install frontend-design@dharun  
copilot plugin install security-guidance@dharun
```

Or clone this repository and reference locally:

```bash
# Clone the repository
git clone https://github.com/dharun/dharunrepo.git

# Reference plugins in your project's .github/copilot/settings.json
```

## 📋 Plugin Details

- [Code Review Plugin](./plugins/code-review/README.md)
- [Frontend Design Plugin](./plugins/frontend-design/README.md)
- [Security Guidance Plugin](./plugins/security-guidance/README.md)

## 🔧 Project Structure

```
dharunrepo/
└── plugins/
    ├── code-review/
    │   ├── .github/plugin/
    │   │   └── plugin.json
    │   ├── commands/
    │   │   └── code-review.md
    │   └── README.md
    ├── frontend-design/
    │   ├── .github/plugin/
    │   │   └── plugin.json
    │   ├── skills/
    │   │   └── frontend-design/
    │   │       └── SKILL.md
    │   └── README.md
    └── security-guidance/
        ├── .github/plugin/
        │   └── plugin.json
        ├── hooks/
        │   ├── hooks.json
        │   └── security_reminder_hook.py
        └── README.md
```

## 📚 Documentation

For more information about GitHub Copilot customization:

- [VS Code Copilot Customization Documentation](https://code.visualstudio.com/docs/copilot/copilot-customization)
- [Awesome GitHub Copilot](https://github.com/github/awesome-copilot)

## 📝 License

MIT
