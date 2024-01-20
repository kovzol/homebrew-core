class xaos < Formula
  desc "Real interactive fractal zoomer"
  homepage "https://xaos-project.github.io/"
  url "https://github.com/xaos-project/XaoS/archive/refs/tags/4.3.2-cmake.tar.gz"
  sha256 "788197afce06bbaabe55af4c98080d8c0878d0a2faa5d57e2b74dcbb0bdb381d"
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
