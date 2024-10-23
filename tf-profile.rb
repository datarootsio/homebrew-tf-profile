class TfProfile < Formula
  desc "This is a brewtap which downloads the binary file and makes it executable for the following repository https://github.com/datarootsio/tf-profile"
  homepage "https://github.com/datarootsio/tf-profile"
  license "MIT"
  tag = `git ls-remote --tags --sort="v:refname" --refs https://github.com/datarootsio/tf-profile.git | tail -n1 | awk -F/ '{print $NF}'`.strip

  version tag 
  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-darwin-amd64.zip"
      sha256 "d471c95611fec113afcdf7f6f7cdd8ae9ce340e365947e6ad182ba69b665915a"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-darwin-arm64.zip"
      sha256 "16365c19c3202dab4351d11e20823109820189380d02da63bdee6959b438c72e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-linux-amd64.zip"
      sha256 "9d0156ef873a516249ce86cef2cdff8a7a78089469ebecf1bb9eb20d5a2dae43"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-linux-arm64.zip"
      sha256 "eb3b134ec066b63a0b6015d26d03bfe07b3c997e399b0092c7dcc4a961bdddaf"
    end
  elsif OS.windows?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-windows-amd64.zip"
      sha256 "051c32352431a36dcc9e7668531fbf442dc9323e7ffefbfb4248447802c4f271"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.5.0/tf-profile-v0.5.0-windows-arm64.zip"
      sha256 "02f83061c4f6ea6184eace668c0a242eea3115f6be7f7b56c2b542cd9cc40603"
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
