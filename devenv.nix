{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.NODE_ENV = "development";

  # https://devenv.sh/packages/
  packages = [
    pkgs.nodejs_20
    pkgs.nodePackages.pnpm
    pkgs.git
  ];

  # https://devenv.sh/languages/
  languages.javascript.enable = true;
  languages.javascript.package = pkgs.nodejs_20;

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks = {
    prettier.enable = true;
  };

  # Scripts
  scripts.dev.exec = "pnpm dev";
  scripts.build.exec = "pnpm build";
  scripts.preview.exec = "pnpm preview";

  enterShell = ''
    echo "Node.js development environment ready!"
  '';
} 