class Searcli < Formula
  desc "Read-only Google Search Console CLI"
  homepage "https://github.com/namcheai/searcli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/namcheai/searcli/releases/download/v0.1.0/searcli_v0.1.0_darwin_arm64.tar.gz"
      sha256 "7d7c550e2959b128ddc16b99e229008351094c3e39b32c1e5f437cbf6d803842"
    end
    on_intel do
      url "https://github.com/namcheai/searcli/releases/download/v0.1.0/searcli_v0.1.0_darwin_amd64.tar.gz"
      sha256 "6eac641d1720aa97a8a5ae7bb5a30409f47da84bd85ab47af869c19d3a4ae0b9"
    end
  end
  depends_on :macos

  def install
    bin.install "searcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/searcli version")
    assert_match "accounts", shell_output("SEARCLI_HOME=#{testpath}/state #{bin}/searcli account list")
  end
end
