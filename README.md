# rust-template

![CI](https://github.com/mberetvas/rust-template/actions/workflows/ci.yml/badge.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
- [Customization](#customization)
- [Example Features](#example-features)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)

## Overview
This is a general Rust template with a basic setup and folder structure, designed for use with VS Code. It provides a solid foundation for new Rust projects, supporting both binary and library crates, and includes best practices for development, testing, and CI/CD.

## Features
- **Ready-to-use project structure:** Well-organized folders for source, tests, and configuration.
- **Supports both binary (`src/main.rs`) and library (`src/lib.rs`) crates:** Start with either or both.
- **Example code and integration tests:** Quickly verify your setup.
- **Editor and formatting configuration:** Pre-configured for VS Code, rustfmt, and clippy.
- **Linting with Clippy:** Enforce code quality standards.
- **GitHub Actions CI workflow:** Automated build, test, lint, and format checks.
- **Easy customization for new projects:** Adapt the template to your needs.

## Getting Started
1. **Clone the template:**
   ```sh
   git clone https://github.com/mberetvas/rust-template.git my-new-project
   cd my-new-project
   rm -rf .git
   git init
   ```
2. **Update project metadata:**
   - Edit `Cargo.toml` (name, authors, description, etc.)
   - Update license if needed
3. **Build and run:**
   ```sh
   cargo build
   cargo run
   ```
4. **Test:**
   ```sh
   cargo test
   ```

## Customization
- Add your code to `src/lib.rs` (library) or `src/main.rs` (binary).
- Place integration tests in the `tests/` directory.
- Add examples to the `examples/` directory.
- Configure formatting in `rustfmt.toml` and linting in `clippy.toml`.
- Use the provided GitHub Actions workflow for CI.
- To rename the project, update the `Cargo.toml` name, authors, and description fields.
- To change the license, update the `LICENSE` file and `Cargo.toml` license field.
- To add features, use the `[features]` section in `Cargo.toml`.

## Example Features
- Error handling using `thiserror` (library) or `anyhow` (binary, not included by default)
- Logging with `log` and `env_logger`
- Configuration with `config` crate
- Feature flags in `Cargo.toml`

See `src/lib.rs` and `examples/hello.rs` for code examples.

## Development
- Format code: `cargo fmt`
- Lint code: `cargo clippy`
- Run tests: `cargo test`

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines. To contribute, fork the repository, create a feature branch, and submit a pull request.

## License
This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
