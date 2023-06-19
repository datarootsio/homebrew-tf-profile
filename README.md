# TfProfile Homebrew Formula

This is a Homebrew formula for the [tf-profile](https://github.com/datarootsio/tf-profile) tool, which downloads the binary file and makes it executable.

## Installation

To install TfProfile using Homebrew, run the following command:

```shell
brew tap datarootsio/tf-profile
brew install tf-profile
```

## Release a new version

1. Download 6 zips from the release of [tf-profile releases](https://github.com/datarootsio/tf-profile/releases): three OS (`darwin`, `linux`, `windows`) and two architectures (`arm64`, `amd64`)
2. Use `sha256sum` to generate new hashes for each .zip file
3. Update `tf-profile.rb` with new URLs and hashes for this release
4. Commit and push: `git commit -am "Update tap to version X.Y.Z && git push origin main`
5. Create a new tag and push it: `git tag -a X.Y.Z -m "Version X.Y.Z" && git push origin 0.3.0`
6. Verify that it works: `brew reinstall tf-profile && tf-profile version`
