{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    cargo-edit
    cargo-flamegraph
  ];
}
