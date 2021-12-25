# nvim

## Common issues

### Binary or command could not be found or executed
In the case of downloaded language servers on NixOS, as is mentioned in [the documentation](https://nixos.wiki/wiki/Packaging/Binaries), it might happen that binaries can not be run:

> Downloading and attempting to run a binary on NixOS will almost never work. 

In some cases, e.g. for `rust-analyzer`, patching it with the command below will work:

```shell
patchelf --set-interpreter "$(patchelf --print-interpreter /run/current-system/sw/bin/sh)" ~/.local/share/nvim/lsp_servers/rust/rust-analyzer 
```
