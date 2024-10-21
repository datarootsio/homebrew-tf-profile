class TfProfile < Formula
  desc "This is a brewtap which downloads the binary file and makes it executable for the following repository https://github.com/datarootsio/tf-profile"
  homepage "https://github.com/datarootsio/tf-profile"
  license "MIT"
  tag = `git ls-remote --tags --sort="v:refname" --refs https://github.com/datarootsio/tf-profile.git | tail -n1 | awk -F/ '{print $NF}'`.strip

  version tag 
  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-darwin-amd64.zip"
      sha256 "e9064e76f4f5bfc1143bc61a1e680a2eb26e86feed05326b4085418699039600"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-darwin-arm64.zip"
      sha256 "f8da69b9a09bbc01c60f04c3694f55f4d76dbe0c9c7448b90c1043500598fe5c"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-linux-amd64.zip"
      sha256 "a6318b3a77279615ac981f3d40da0610895678059cf099a82c4cf4bff2aaafbf"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-linux-arm64.zip"
      sha256 "b1a49223619750e8e16bd7892d43094fce2c1a37c922534d45e1cceb63a838b5"
    end
  elsif OS.windows?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-windows-amd64.zip"
      sha256 "aa74640505cded31a782fbc2c6a17e1f50d8e70342c659479fd6944d87132510"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-windows-arm64.zip"
      sha256 "a5c599d41e49e4572e5cb244d8b288b6aa33df497aa783cfaddfbe5e35423c50"
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
