class TfProfile < Formula
  desc "This is a brewtap which downloads the binary file and makes it executable for the following repository https://github.com/datarootsio/tf-profile"
  homepage "https://github.com/datarootsio/tf-profile"
  license "MIT"
  tag = `git ls-remote --tags --sort="v:refname" --refs https://github.com/datarootsio/tf-profile.git | tail -n1 | awk -F/ '{print $NF}'`.strip

  version tag 
  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.3.0/tf-profile-v0.3.0-darwin-amd64.zip"
      sha256 "986b2169e1934bdf6895ef987a2895862318a627708ceec8d7635699422df1f7"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.3.0/tf-profile-v0.3.0-darwin-arm64.zip"
      sha256 "6eef95f971b8e801ab7c260e967e9b8fb7d12a7e17309b3eb0d6eadf3ba4e97b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.3.0/tf-profile-v0.3.0-linux-amd64.zip"
      sha256 "36f5ec0747d18edb61c5f0b8ce2cfa6a71b474113a004234af9828a9eb170c51"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.3.0/tf-profile-v0.3.0-linux-arm64.zip"
      sha256 "ef4f2d1a9ee931159cc1d4da02f6b5a1dc1d350dc8085b4df074edeffd8c912d"
    end
  elsif OS.windows?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.3.0/tf-profile-v0.3.0-windows-amd64.zip"
      sha256 "65636e1606e402789b8f720cc14d97d0e5beefdcd70ae39c101f968ad40906c2"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.3.0/tf-profile-v0.3.0-windows-arm64.zip"
      sha256 "cc850d018324e074111642f6b6b0b7853b2f4a20976f69265ef12302f3fc9498"
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
