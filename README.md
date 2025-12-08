# GitScribe

**GitScribe** is an intelligent release notes generator that bridges the gap between raw git history and customer-facing communication. It aggregates commit logs, code diffs, and strategic user notes, then leverages local AI (Ollama) to draft professional, structured release notes.

Available as a modern Desktop GUI and a high-performance CLI tool.

## 🚀 Features

- **Automated Context Aggregation:** Intelligently combines git history and diffs while excluding noise (lockfiles, assets).
- **AI-Powered Generation:** Connects directly to local LLMs (via Ollama) to write the notes for you.
- **Strategic Input:** Prioritizes your "Adhoc Notes" to ensure the narrative matches your product goals.
- **Jira Integration:** (Optional) Enriches context by fetching details from linked Jira tickets found in commit messages.
- **Cross-Platform:** Runs on Windows, macOS, and Linux.

## 📦 Components

This repository is organized as a Rust Workspace containing:

1.  **Desktop App (`apps/gitscribe`):** A Tauri + React application for a visual, interactive workflow.
2.  **CLI Tool (`crates/context_cli`):** A binary for command-line usage and CI/CD automation.
3.  **Core Library (`crates/context_core`):** Shared logic for git operations and AI integration.

## 🛠️ Quick Start

### Option 1: Desktop GUI (Windows)

1.  Download the latest installer (`.exe`) from the [Releases](#) page.
2.  Run the installer and launch **GitScribe**.
3.  Ensure [Ollama](https://ollama.com/) is installed and running (`ollama serve`).

### Option 2: CLI (Build from Source)

**Prerequisites:** Rust (Cargo) & Git.

```bash
# Build the CLI tool
cargo build --release -p context_cli

# Run the binary
./target/release/context_cli --start HEAD~5 --end HEAD --ollama-model llama3
```

## 📚 Documentation

- **[User Guide](docs/USER_GUIDE.md):** Detailed instructions for GUI and CLI usage.
- **[Feature Specifications](docs/features/):** BDD feature files describing system behavior.
- **[Architecture Plans](docs/ai/):** High-level design and implementation notes.

## 🤝 Contributing

This project uses a **Docs-as-Code** approach.
- Feature requirements are defined in `docs/features/*.feature`.
- Please run tests before submitting PRs: `npm test` (Frontend) and `cargo test` (Backend).

## 📄 License

[MIT License](LICENSE)