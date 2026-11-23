class Bifold < Formula
  desc "Two-pane file manager for the terminal"
  homepage "https://lab18net.github.io/bifold/"
  url "https://github.com/lab18net/bifold/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "63ee51a5c40cf4a91051c83e9288877cc537025e921d2f9c3531b86165132814"
  license "MIT"
  head "https://github.com/lab18net/bifold.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/tui")
    man1.install "man/bifold.1"
  end

  def caveats
    <<~EOS
      Press `h` inside bifold for the help screen.
      Preferences and key bindings live in ~/.config/bifold/config.toml.
      The desktop front end is a separate formula: brew install bifold-gui
    EOS
  end

  test do
    assert_match(/Bifold \d+\.\d+\.\d+/, shell_output("#{bin}/bifold --version"))
    assert_match "nord", shell_output("#{bin}/bifold --list-themes")
    assert_match "switch_pane", shell_output("#{bin}/bifold --no-config --dump-keys")

    (testpath/"folder").mkpath
    (testpath/"hello.txt").write "hi"
    listing = shell_output("#{bin}/bifold --no-config --dump --path #{testpath}")
    assert_match "hello.txt", listing
    assert_match "folder/", listing

    assert_path_exists man1/"bifold.1"
  end
end
