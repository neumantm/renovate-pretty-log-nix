# renovate-pretty-log-nix

Nix flake for renovate-pretty-log (https://gitlab.com/tanna.dev/renovate-pretty-log)

## Usage

Run the following command:

```sh
nix run github:neumantm/renovate-pretty-log-nix -- -path <path-to-log-file>
```

For the terminal user interface, run:

```sh
nix shell github:neumantm/renovate-pretty-log-nix -c renovate-pretty-log-tui -path <path-to-log-file>
```

For the text-to-JSON utility, run:

```sh
nix shell github:neumantm/renovate-pretty-log-nix -c renovate-text-to-json -path <path-to-log-file>
```

For further usage info see the [renovate-pretty-log documentation](https://gitlab.com/tanna.dev/renovate-pretty-log).
