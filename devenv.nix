{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  # Parallel deps compilation
  env.MIX_OS_DEPS_COMPILE_PARTITION_COUNT = 8;

  # https://devenv.sh/packages/
  packages = with pkgs; [
    python3
    python3Packages.torch
    python3Packages.torchvision
    python3Packages.onnx
  ] ++ lib.optionals (pkgs.python3Packages ? onnxscript) [
    python3Packages.onnxscript
  ];

  # https://devenv.sh/languages/
  languages.elixir.enable = true;
  languages.elixir.package = pkgs.elixir_1_19;
  languages.python.enable = true;
  languages.rust.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
