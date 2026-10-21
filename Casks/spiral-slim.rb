cask "spiral-slim" do
  version "1.0.1"
  sha256 "5400bcef62523a02a4a508254aac98ac6e4f189a0ee2b68b15e2fb5eee6e4fce"

  url "https://github.com/cococool13/spiral/releases/download/slim-v#{version}/Spiral.Slim_#{version}_universal.dmg",
      verified: "github.com/cococool13/spiral/"
  name "Spiral Slim"
  desc "Wizard that hardens Brave with enterprise privacy policies"
  homepage "https://spiralcc.tech/"

  # Same repo as Wallpaper and Resume. Only slim-v* tags are Slim releases.
  livecheck do
    url :url
    regex(/^slim[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
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
