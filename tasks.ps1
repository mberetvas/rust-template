# PowerShell script for common Rust tasks
param(
    [Parameter(Position=0)]
    [ValidateSet("build", "test", "fmt", "clippy", "run", "example")]
    [string]$Task = "build"
)

switch ($Task) {
    "build"   { cargo build }
    "test"    { cargo test }
    "fmt"     { cargo fmt --all }
    "clippy"  { cargo clippy --all-targets --all-features -- -D warnings }
    "run"     { cargo run }
    "example" { cargo run --example hello }
    default   { Write-Host "Unknown task: $Task" }
}
