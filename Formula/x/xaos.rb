class Xaos < Formula
  desc "Real interactive fractal zoomer"
  homepage "https://xaos-project.github.io/"
  url "https://github.com/xaos-project/XaoS/archive/refs/tags/4.3.2-cmake2.tar.gz"
  sha256 "1abb14b4ccb2cf12d8ff3bac787b1bc4f956bf15419d2fdcdc466ffe3e45ce65"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "cmake" => :build
  depends_on "qt"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # Set QT_QPA_PLATFORM to minimal to avoid error "qt.qpa.xcb: could not connect to display"
    ENV["QT_QPA_PLATFORM"] = "minimal" if OS.linux? && ENV["HOMEBREW_GITHUB_ACTIONS"]
    output = shell_output("#{bin}/XaoS -speedtest | grep speed | wc -l")
    assert_match "5", output # there must be exactly 5 matches
  end
end
