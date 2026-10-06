# Written by the Release workflow from scripts/homebrew/cask.rb in the application's repository, at
# every release; an edit made in the tap is overwritten by the next one.
cask "northern-commander@beta" do
  version "0.11.0"
  sha256 "d027e36fa449423baa2dfd6a734e5428a2fa5de6f4d7fa1f1dd4f1c1619a32ca"

  url "https://downloads.northerncommander.com/app/macos/NorthernCommander-#{version}.dmg"
  name "Northern Commander (beta)"
  desc "Keyboard-first, two-pane file manager"
  homepage "https://northerncommander.com/"

  auto_updates true
  conflicts_with cask: "northern-commander"
  depends_on macos: ">= :ventura"

  app "Northern Commander.app"

  # Not ~/.northern-commander: it holds the person's settings and, unless they moved them, their backups.
  zap trash: [
    "~/Library/Caches/dev.outonomy.northerncommander",
    "~/Library/HTTPStorages/dev.outonomy.northerncommander",
    "~/Library/Preferences/dev.outonomy.northerncommander.plist",
    "~/Library/Saved Application State/dev.outonomy.northerncommander.savedState",
  ]
end
