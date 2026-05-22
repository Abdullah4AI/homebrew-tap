class Appledev < Formula
  desc "Apple Developer Toolkit - unified CLI for App Store Connect + iOS app builder"
  homepage "https://github.com/Abdullah4AI/apple-developer-toolkit"
  url "https://github.com/Abdullah4AI/apple-developer-toolkit/archive/refs/tags/v1.260522.0.tar.gz"
  sha256 "4759d2e69ec9f2a85851ecc99aa1cc5c4e7614aecade6bd41ae476a37dd8fefa"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X main.commit=#{tap.user}
      -X main.date=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags:), "./cmd/appledev/"
    bin.install_symlink "appledev" => "appstore"
    bin.install_symlink "appledev" => "swiftship"
  end

  test do
    assert_match "appledev", shell_output("#{bin}/appledev --help")
    assert_match "SwiftShip", shell_output("#{bin}/swiftship --help")
    assert_match "App Store Connect", shell_output("#{bin}/appstore --help")
  end
end
