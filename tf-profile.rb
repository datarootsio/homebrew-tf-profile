class TfProfile < Formula
  desc "This is a brewtap which downloads the binary file and makes it executable for the following repository https://github.com/datarootsio/tf-profile"
  homepage "https://github.com/datarootsio/tf-profile"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.2.1/tf-profile-v0.2.1-darwin-amd64.zip"
      sha256 "837321de7a93811e9758a1e206389aba1f702de75787d2c9b7f9f389f23010cb"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.2.1/tf-profile-v0.2.1-darwin-arm64.zip"
      sha256 "7655887e8093b5953e4e36e1ac68bab7c08e1cf20dcd25e44ce41ad4f8d1c383"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.2.1/tf-profile-v0.2.1-linux-amd64.zip"
      sha256 "5be66284df9cf363b961d8b15ea28e69048129b9bc96fa13e585c65ec90e16cb"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.2.1/tf-profile-v0.2.1-linux-arm64.zip"
      sha256 "54199c4b2b9c2ad6182884e9a9b5deab320fc65b626a822bc2be04a4f2cb8a76"
    end
  elsif OS.windows?
    if Hardware::CPU.intel?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.2.1/tf-profile-v0.2.1-windows-amd64.zip"
      sha256 "8445b6452375ce0f1cf64645ccd50181b0762e8a9ff984655472d1a26a6a396b"
    elsif Hardware::CPU.arm?
      url "https://github.com/datarootsio/tf-profile/releases/download/v0.2.1/tf-profile-v0.2.1-windows-arm64.zip"
      sha256 "340b614a5e0d194f2410e1df2c7b8c97bb35f596e4ef838da5c7cc8846ce6e8b"
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
