class Rr < Formula
  desc "Add Apple Reminders from the terminal in plain English"
  homepage "https://github.com/kirubakaran/rr"
  url "https://github.com/kirubakaran/rr/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "07119fcca6bf0de32d5c363e75b6f4442c0be0b2f54652d8ef5cd1a723ace969"
  license "Apache-2.0"
  head "https://github.com/kirubakaran/rr.git", branch: "master"

  depends_on macos: :sonoma

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/rr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rr --version")
  end
end
