class Graylogctl < Formula
  desc "Production-focused Graylog v6 CLI"
  homepage "https://github.com/codifydoo/graylog-cli"
  url "https://github.com/codifydoo/graylog-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "aa490860622768117751a09c7dee7d02b34624a33ccfa447db4e4ab498e8d26c"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/graylogctl"
  end

  test do
    assert_match "Graylog v6 CLI", shell_output("#{bin}/graylogctl --help")
  end
end
