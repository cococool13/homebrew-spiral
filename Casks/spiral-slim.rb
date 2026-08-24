cask "spiral-slim" do
  version "1.0.0"
  sha256 "946613cd04d45614937745450fbe339cafb1f697730eec319930fb924c8cd845"

  # v1.0.0 predates the move into the Spiral monorepo, so it is still served
  # from the archived Spiral-Slim release. Later versions ship from
  # github.com/cococool13/spiral under a slim-v* tag.
  url "https://github.com/cococool13/Spiral-Slim/releases/download/v#{version}/Spiral.Slim_#{version}_universal.dmg",
      verified: "github.com/cococool13/Spiral-Slim/"
  name "Spiral Slim"
  desc "Wizard that hardens Brave with enterprise privacy policies"
  homepage "https://spiralcc.tech/"

  # The archived repo still carries SlimBrave Neo's upstream tags, so a version
  # check there reports a release that has nothing to do with this cask.
  livecheck do
    skip "Archived repository; v1.0.0 is its final Spiral Slim release"
  end

  depends_on macos: :catalina

  app "Spiral Slim.app"

  # Only the app's own files. The browser policies and the macOS Configuration
  # Profile that Slim installs are deliberately left alone: they are the user's
  # browser configuration, not this app's data, and Slim has its own reset for
  # them. Uninstalling the wizard must not silently undo the hardening.
  zap trash: [
    "~/Library/Application Support/app.spiral.slim",
    "~/Library/Caches/app.spiral.slim",
    "~/Library/Preferences/app.spiral.slim.plist",
    "~/Library/Saved Application State/app.spiral.slim.savedState",
  ]
end
