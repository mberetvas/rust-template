# Common tasks for rust-template

build:
	cargo build

test:
	cargo test

fmt:
	cargo fmt --all

clippy:
	cargo clippy --all-targets --all-features -- -D warnings

run:
	cargo run

example:
	cargo run --example hello
