cask "bifold-app" do
  version "0.1.8"
  sha256 "5d78f1c0d34d518d91639a2f079f6294ee6d068c196659eff76899808ad5cc4d"

  url "https://github.com/lab18net/bifold/releases/download/v#{version}/Bifold-#{version}-aarch64.app.zip"
  name "Bifold"
  desc "Two-pane file manager, desktop app"
  homepage "https://lab18net.github.io/bifold/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Bifold.app"

  # The app is ad-hoc signed and not notarised (no Developer ID yet), so without
  # this Gatekeeper refuses to open it. Remove once releases are notarised.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Bifold.app"]
  end

  zap trash: [
    "~/.config/bifold",
    "~/Library/Saved Application State/net.lab18.bifold.savedState",
  ]
end
