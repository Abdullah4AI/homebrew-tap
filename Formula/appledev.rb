class Appledev < Formula
  desc "Apple Developer Toolkit - unified CLI for App Store Connect + iOS app builder"
  homepage "https://github.com/Abdullah4AI/apple-developer-toolkit"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Abdullah4AI/apple-developer-toolkit/releases/download/v1.0.0/appledev_1.0.0_darwin_arm64.tar.gz"
      sha256 "00e646f2a7928b647f2ccb112d1e25d14b72341d77e8bf64822e9ac93293958b"

      def install
        bin.install "appledev_darwin_arm64" => "appledev"
        bin.install_symlink "appledev" => "appstore"
        bin.install_symlink "appledev" => "swiftship"
      end
    else
      url "https://github.com/Abdullah4AI/apple-developer-toolkit/releases/download/v1.0.0/appledev_1.0.0_darwin_amd64.tar.gz"
      sha256 "181a13bfd452f1e6686334b5728f53a0a5c3225282ed73e57f941afea220f664"

      def install
        bin.install "appledev_darwin_amd64" => "appledev"
        bin.install_symlink "appledev" => "appstore"
        bin.install_symlink "appledev" => "swiftship"
      end
    end
  end

  test do
    assert_match "appledev", shell_output("#{bin}/appledev --help")
    assert_match "SwiftShip", shell_output("#{bin}/swiftship --help")
    assert_match "App Store Connect", shell_output("#{bin}/appstore --help")
  end
end
