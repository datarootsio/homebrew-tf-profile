class TfProfile < Formula
  desc "This is a brewtap which downolads the binary file and make it executable for the following repository https://github.com/datarootsio/tf-profile"
  homepage "https://github.com/datarootsio/tf-profile"
  url "https://github.com/datarootsio/tf-profile/releases/download/release%2F0.2.0/tf-profile-v0.2.0-darwin.zip"
  sha256 "a866c27a2b2200d38feb542be8a406f40dd1934063f3d84c6e683999bbac01bb"
  license "MIT"

  def install
    bin.install tf-profile
  end

  test do
    # Verify that the binary exists and is executable
    assert_predicate bin/"tf-profile", :exist?
    assert_predicate bin/"tf-profile", :executable?

    # Run a simple test command
    output = shell_output("#{bin}/tf-profile --help")
    assert_match "Usage:", output.lines.first.chomp
    system "false"
  end
end