{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    clang
    cargo-edit
    cargo-flamegraph
    zig
    gcc

    # Profiling
    valgrind
    massif-visualizer

    # File synchronization
    syncthing
  ];
}
