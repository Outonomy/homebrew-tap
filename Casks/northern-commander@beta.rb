# Written by the Release workflow from scripts/homebrew/cask.rb in the application's repository, at
# every release; an edit made in the tap is overwritten by the next one.
cask "northern-commander@beta" do
  version "1.2.0"
  sha256 "ba6dac8f0e22bd560c13ff1320956f0958df9b064cad0743cce6a06f8928c195"

  url "https://downloads.northerncommander.com/app/macos/NorthernCommander-#{version}.dmg"
  name "Northern Commander (beta)"
  desc "Keyboard-first, two-pane file manager"
  homepage "https://northerncommander.com/"

  auto_updates true
  conflicts_with cask: "northern-commander"
  depends_on macos: ">= :ventura"

  app "Northern Commander.app"
  binary "#{appdir}/Northern Commander.app/Contents/MacOS/ncmd"
  binary "#{appdir}/Northern Commander.app/Contents/MacOS/ncmd", target: "northern-commander"

  # Not ~/.northern-commander: it holds the person's settings and, unless they moved them, their backups.
  zap trash: [
    "~/Library/Caches/dev.outonomy.northerncommander",
    "~/Library/HTTPStorages/dev.outonomy.northerncommander",
    "~/Library/Preferences/dev.outonomy.northerncommander.plist",
    "~/Library/Saved Application State/dev.outonomy.northerncommander.savedState",
  ]
end
