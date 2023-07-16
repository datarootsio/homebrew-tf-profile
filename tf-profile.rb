class TfProfile < Formula
  desc "This is a brewtap which downloads the binary file and makes it executable for the following repository https://github.com/datarootsio/tf-profile"
  homepage "https://github.com/datarootsio/tf-profile"
  license "MIT"
  tag = `git ls-remote --tags --sort="v:refname" --refs https://github.com/datarootsio/tf-profile.git | tail -n1 | awk -F/ '{print $NF}'`.strip

  version tag 
  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.4.0/tf-profile-v0.4.0-darwin-amd64.zip"
      sha256 "b5afb85a1d2936d95928b5ca5d59001c6ad0fe5be48af2e03fd1d32b2f17b589"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.4.0/tf-profile-v0.4.0-darwin-arm64.zip"
      sha256 "cc702bdf5698fb81b3f87803308df9e57870a55ac05132cda3e60ca11880a1a1"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.4.0/tf-profile-v0.4.0-linux-amd64.zip"
      sha256 "a58bf4407436c1ac8553774c8b385ef23f0a2484e75f1fb13888ac8aa9e7ac6a"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.4.0/tf-profile-v0.4.0-linux-arm64.zip"
      sha256 "6456e7a62dc14862c06ed80f5688901af697c5dfd415daf1a4c99bc54870f164"
    end
  elsif OS.windows?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.4.0/tf-profile-v0.4.0-windows-amd64.zip"
      sha256 "ea2dbdea521b18c83d430c8a975e2b6661680e9996e4afb079a5b5ec788885e1"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.4.0/tf-profile-v0.4.0-windows-arm64.zip"
      sha256 "dfb1285eef14286e87e5ebc335a7dc1254673ddcba78eb0b7f547dfb680a514b"
    end
  end

  def install
    bin.install "tf-profile"
  end

  def caveats
    <<~EOS
      tf-profile has been installed. You can run it using the "tf-profile" command. For additional info, please refer to the following readme: https://github.com/datarootsio/tf-profile/blob/main/README.md
    EOS
  end

  test do
    # Verify that the binary exists and is executable
    assert_predicate bin/"tf-profile", :exist?
    assert_predicate bin/"tf-profile", :executable?

    # Run a simple test command
    output = shell_output("#{bin}/tf-profile --help")
    assert_match "Usage:", output.lines.first.chomp
  end
end
