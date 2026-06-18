# oci-tfswitch

A minimal OCI image that packages [tfswitch](https://github.com/warrensbox/terraform-switcher) for use in devcontainer builds.

## What it does

The `Containerfile` downloads a pinned release of `tfswitch` from GitHub and produces a scratch-based image containing only the binary. This keeps the image as small as possible with no runtime dependencies.

The image is built for `linux/amd64` and `linux/arm64` via GitHub Actions and published to the GitHub Container Registry at:

```
ghcr.io/oci-tfswitch:latest
```

## Usage

Copy the binary into your devcontainer image:

```dockerfile
COPY --from=ghcr.io/thredd-platform/oci-tfswitch:latest / /
```

## Version updates

[Renovate](https://docs.renovatebot.com/) is configured to automatically open pull requests when new releases of `tfswitch` are published, keeping `TERRAFORM_SWITCHER_VERSION` in the `Containerfile` up to date.
