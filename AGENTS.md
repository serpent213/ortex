# Repository Guidelines

## Project Structure & Module Organization
- `lib/` holds the Elixir source code (public API, backends, and serving integration).
- `native/ortex/` contains the Rust NIF implementation and Cargo configuration.
- `test/` has ExUnit tests; some tests depend on ONNX model files in `models/`.
- `examples/` and `python/` provide runnable demos and model export scripts.
- `config/` includes runtime configuration defaults.

## Build, Test, and Development Commands
- `mix deps.get` installs Elixir dependencies.
- `mix compile` builds the project and compiles the Rust NIF via Rustler.
- `mix test` runs the ExUnit suite.
- `mix format` formats Elixir code using `.formatter.exs`.
- `python python/export_resnet.py` generates `models/resnet50.onnx` for full test coverage.

## Coding Style & Naming Conventions
- Indentation: 2 spaces in Elixir files; follow `mix format` output.
- Modules use `CamelCase` (e.g., `Ortex.Serving`); functions and variables use `snake_case`.
- Tests follow `*_test.exs` naming and use descriptive `test "..."` labels.
- Rust code in `native/ortex/` should follow standard Rust formatting (`cargo fmt` if needed).

## Testing Guidelines
- Framework: ExUnit.
- Tests that rely on the ResNet50 model are tagged `:resnet50` and are auto-excluded when the model file is missing.
- Prefer small, deterministic tensors in unit tests to keep runtime low.

## Commit & Pull Request Guidelines
- Commit messages are short and descriptive, often with a scope prefix (e.g., `CI: ...`, `fix ...`, `adding ...`).
- PRs should describe the change, mention relevant tests (`mix test` or specific commands), and link issues if applicable.
- If a change affects native code, call out Rust toolchain requirements and any platform-specific notes.

## Configuration & Dependencies
- Rust is required to compile the NIF (see `native/ortex/`).
- ONNX models live in `models/`; avoid committing large binaries unless necessary.
