class Searcli < Formula
  desc "Read-only Google Search Console CLI"
  homepage "https://github.com/namcheai/searcli"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/namcheai/searcli/releases/download/v0.1.1/searcli_v0.1.1_darwin_arm64.tar.gz"
      sha256 "34eb5785d8548c60050864ae34e3b4ddbef9e792e2ae513ca8772556f7c5f00b"
    end
    on_intel do
      url "https://github.com/namcheai/searcli/releases/download/v0.1.1/searcli_v0.1.1_darwin_amd64.tar.gz"
      sha256 "8522c0bbf3c3ec56aa58661bfc16fc936148c4beee4e514f05d847387b0e1677"
    end
  end

  def install
    bin.install "searcli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/searcli version")
    assert_match "accounts", shell_output("SEARCLI_HOME=#{testpath}/state #{bin}/searcli account list")
  end
end
