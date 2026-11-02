# Written by the Release workflow from scripts/homebrew/cask.rb in the application's repository, at
# every release; an edit made in the tap is overwritten by the next one.
cask "northern-commander@beta" do
  version "1.1.0"
  sha256 "c4bb7af52c61880d8f64a81f9e03bc038863c95d7f81d885346510ac383475ac"

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
