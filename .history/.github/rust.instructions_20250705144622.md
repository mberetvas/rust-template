---
description: 'Rust coding conventions and guidelines'
applyTo: '**/*.rs'
---

# Rust Coding Conventions

## Rust Instructions

- Write clear and concise doc comments (`///`) for every public function, struct, and enum.
- Ensure functions and variables have descriptive names following Rust's naming conventions.
- Generate and view documentation using `cargo doc`.
- Use standard library types effectively (e.g., `Vec<T>`, `HashMap<K, V>`, `Option<T>`, `Result<T, E>`).
- Break down complex functions into smaller, more manageable functions.

## Error Handling

- Handle recoverable errors robustly using `Result<T, E>` and `Option<T>`. Avoid using `panic!` in library code.
- **For libraries**, use the **`thiserror`** crate to create specific, custom error types. This allows downstream users to match on and handle different kinds of errors programmatically.
- **For applications (binaries)**, use the **`anyhow`** crate for simpler, flexible error handling. `anyhow::Result` is great for application logic where you primarily need to report errors with context, rather than match on specific error types.

### `thiserror` Example (Library)

```rust
use thiserror::Error;

#[derive(Error, Debug)]
pub enum DataError {
    #[error("Failed to connect to the database")]
    Connection(#[from] std::io::Error),
    #[error("Record not found for ID: {0}")]
    NotFound(String),
}

pub fn fetch_data(id: &str) -> Result<(), DataError> {
    // ... logic that might fail ...
    Err(DataError::NotFound(id.to_string()))
}
```

### `anyhow` Example (Application)

```rust
use anyhow::{Context, Result};

fn read_config(path: &str) -> Result<String> {
    std::fs::read_to_string(path)
        .context(format!("Failed to read config file from {}", path))
}

fn main() -> Result<()> {
    let config = read_config("config.toml")?;
    println!("Config loaded: {}", config);
    Ok(())
}
```

## General Instructions

- Always prioritize readability, clarity, and safety.
- For algorithm-related code, include explanations of the approach used in comments.
- Write code with good maintainability practices, including comments on why certain design decisions (especially those related to lifetimes or ownership) were made.
- For external dependencies (crates), mention their usage and purpose in comments.
- Use consistent naming conventions (`snake_case` for functions and variables, `PascalCase` for types).
- Write concise, efficient, and idiomatic Rust, embracing concepts like ownership, borrowing, and iterators.

## Code Style and Formatting

- Use **`rustfmt`** to automatically format your code. This is the standard in the Rust ecosystem.
- Configure your editor to run `rustfmt` on save.
- Maintain the default line length of 100 characters.
- Place doc comments (`///`) directly above the item they are documenting.
- Use `rustfmt` to handle blank lines and spacing consistently.

## Edge Cases and Testing

- Use Rust's built-in testing framework by creating a `#[cfg(test)]` module.
- Write unit tests for functions using the `#[test]` attribute.
- Account for common edge cases like empty collections, `None` variants, and `Err` variants from `Result`.
- Include documentation for edge cases and the expected behavior in those cases.
- Use documentation tests within `///` comments to provide examples that are verified at compile time.

## Example of Proper Documentation

```rust
use std::f64::consts::PI;

/// Calculates the area of a circle given the radius.
///
/// # Arguments
///
/// * `radius` - A floating-point number that represents the radius of the circle.
///
/// # Returns
///
/// The area of the circle as a floating-point number.
///
/// # Errors
///
/// This function will return an error if the radius is negative.
///
/// # Examples
///
/// ```
/// // Assuming my_module is the name of your crate or module
/// assert_eq!(my_module::calculate_area(10.0).unwrap(), 314.1592653589793);
/// ```
pub fn calculate_area(radius: f64) -> Result<f64, &'static str> {
    if radius < 0.0 {
        return Err("Radius cannot be negative");
    }
    // The area is calculated as π * radius^2
    Ok(PI * radius.powi(2))
}
```
