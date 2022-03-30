{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    binutils
    openssl.dev
    pkg-config
    clang
    cargo-edit
    cargo-watch
    cargo-flamegraph
    gcc
    # High-performance drop-in replacement for existing unix linkers
    mold
    zig

    # Profiling
    valgrind
    massif-visualizer
    gnuplot

    # File synchronization
    syncthing
  ];
}
