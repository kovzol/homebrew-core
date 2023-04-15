class Aris < Formula
  desc "Logical proof program"
  homepage "https://github.com/kovzol/aris"
  url "https://github.com/kovzol/aris/archive/refs/tags/2.2-15042023.tar.gz"
  sha256 "7c44f0d53c1c2ab535653159f9aac47c9614426756d6f7c35bea19024331d3b1"
  license "GPL-3.0-or-later"

  depends_on "cmake" => :build
  depends_on "cairo"
  depends_on "coreutils"
  depends_on "gtk+3"
  depends_on "libxml2"
  depends_on "pango"
  depends_on "pkg-config"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    system "#{bin}/aris", "--help"
  end
end
