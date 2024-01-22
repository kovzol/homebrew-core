class Xaos < Formula
  desc "Real interactive fractal zoomer"
  homepage "https://xaos-project.github.io/"
  url "https://github.com/xaos-project/XaoS/archive/refs/tags/4.3.2-cmake2.tar.gz"
  sha256 "1abb14b4ccb2cf12d8ff3bac787b1bc4f956bf15419d2fdcdc466ffe3e45ce65"
  license "GPL-2.0"

  depends_on "cmake" => :build
  depends_on "qt"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    output = shell_output("#{bin}/XaoS -help | grep help | wc -l")
    assert_match "2", output
  end
end
