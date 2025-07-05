---
description: 'Rust coding conventions and guidelines'
applyTo: '**/*.rs'
---

# Rust Coding Conventions

## Rust Instructions

- Write clear and concise comments for each function using `//` or `///` for documentation.
- Ensure functions have descriptive names following `snake_case` convention.
- Use Rust's built-in type system and explicit type annotations when helpful for clarity.
- Provide documentation comments using `///` following Rust documentation conventions.
- Break down complex functions into smaller, more manageable functions.
- Use `Result<T, E>` and `Option<T>` types for error handling and nullable values.

## General Instructions

- Always prioritize readability and clarity.
- For algorithm-related code, include explanations of the approach used.
- Write code with good maintainability practices, including comments on why certain design decisions were made.
- Handle errors properly using `Result` types and the `?` operator for error propagation.
- For external dependencies (crates), mention their usage and purpose in comments.
- Use consistent naming conventions: `snake_case` for functions/variables, `PascalCase` for types/structs.
- Write concise, efficient, and idiomatic Rust code that is also easily understandable.
- Leverage Rust's ownership system and borrow checker for memory safety.

## Code Style and Formatting

- Follow **rustfmt** conventions and use `cargo fmt` for automatic formatting.
- Maintain proper indentation (use 4 spaces for each level of indentation).
- Ensure lines do not exceed 100 characters (configurable in rustfmt).
- Place documentation comments (`///`) immediately before function, struct, or module declarations.
- Use blank lines to separate functions, structs, implementations, and modules where appropriate.
- Prefer explicit return types for public functions.

## Error Handling and Testing

- Always use `Result<T, E>` for functions that can fail instead of panicking.
- Account for common edge cases like empty inputs, invalid data, and boundary conditions.
- Include comments for edge cases and the expected behavior in those cases.
- Write unit tests using `#[cfg(test)]` modules and document them with clear test names.
- Use `#[test]` attribute for test functions and consider property-based testing with crates like `proptest`.

## Example of Proper Documentation

```rust
/// Calculate the area of a circle given the radius.
/// 
/// # Arguments
/// 
/// * `radius` - A positive f64 representing the radius of the circle
/// 
/// # Returns
/// 
/// Returns `Ok(f64)` containing the area of the circle (π * radius²),
/// or `Err(String)` if the radius is negative.
/// 
/// # Examples
/// 
/// ```
/// let area = calculate_area(5.0).unwrap();
/// assert_eq!(area, std::f64::consts::PI * 25.0);
/// ```
pub fn calculate_area(radius: f64) -> Result<f64, String> {
    if radius < 0.0 {
        return Err("Radius cannot be negative".to_string());
    }
    Ok(std::f64::consts::PI * radius * radius)
}
```
