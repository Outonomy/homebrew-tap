# Written by the Release workflow from scripts/homebrew/cask.rb in the application's repository, at
# every release; an edit made in the tap is overwritten by the next one.
cask "northern-commander" do
  version "0.12.0"
  sha256 "85e6927bb49cabb58901df6fa8aff226b2816f8d0672bb70fdd9bf7fcc27fd7b"

  url "https://downloads.northerncommander.com/app/macos/NorthernCommander-#{version}.dmg"
  name "Northern Commander"
  desc "Keyboard-first, two-pane file manager"
  homepage "https://northerncommander.com/"

  auto_updates true
  conflicts_with cask: "northern-commander@beta"
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
