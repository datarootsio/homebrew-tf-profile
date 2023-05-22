
class TfProfile < Formula
  desc "This Formula runs the following repository: https://github.com/datarootsio/tf-profile"
  homepage "https://github.com/datarootsio/tf-profile"
  url "https://github.com/datarootsio/tf-profile/archive/refs/tags/release/0.2.0.tar.gz"
  sha256 "8e98face8a11b4094b050c337efc47498eca39594e1a9bf786a5f24d02aac993"
  license "MIT"

  depends_on "go" => :build
  def install
    # Extract the source code archive
    system "tar", "xf", "#{cached_download}", "--strip-components=1"

    # Build the Go code
    system "go", "build", "."

    # Install the binary
    bin.install "tf-profile"
  end

  def caveats
    <<~EOS
      tf-profile has been installed. You can run it using the "tf-profile" command.

      If you want to run tf-profile from other directories, you can create a symbolic link to /usr/local/bin:
        sudo ln -s #{opt_bin}/tf-profile /usr/local/bin
    EOS
  end

  test do
    # Run tf-profile --help and check the output
    assert_match "tf-profile is a CLI tool to profile Terraform runs", shell_output("#{bin}/tf-profile --help")
  end
end
