class BifoldGui < Formula
  desc "Two-pane file manager, desktop window"
  homepage "https://lab18net.github.io/bifold/"
  url "https://github.com/lab18net/bifold/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "63ee51a5c40cf4a91051c83e9288877cc537025e921d2f9c3531b86165132814"
  license "MIT"
  head "https://github.com/lab18net/bifold.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/gui")
    man1.install "man/bifold-gui.1"
  end

  def caveats
    <<~EOS
      Start it with `bifold-gui`. It shares its configuration, key bindings
      and themes with the terminal front end (brew install bifold).
    EOS
  end

  test do
    assert_match(/Bifold \d+\.\d+\.\d+/, shell_output("#{bin}/bifold-gui --version"))
    assert_match "nord", shell_output("#{bin}/bifold-gui --list-themes")
    assert_path_exists man1/"bifold-gui.1"
  end
end
