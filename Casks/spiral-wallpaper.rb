cask "spiral-wallpaper" do
  version "1.0.4"
  sha256 "39becff78ad05abd0e6760d6ff8c3b6f7dad9f2c7c0e02d223364ed25da7eb91"

  url "https://github.com/cococool13/spiral/releases/download/v#{version}/Spiral.Wallpaper_#{version}_universal.dmg",
      verified: "github.com/cococool13/spiral/"
  name "Spiral Wallpaper"
  desc "Browse wallpapers and set them as your desktop background"
  homepage "https://spiralcc.tech/"

  depends_on macos: :ventura

  app "Spiral Wallpaper.app"

  # Everything the app writes lives under its bundle identifier.
  zap trash: [
    "~/Library/Application Support/app.spiral.wallpaper",
    "~/Library/Caches/app.spiral.wallpaper",
    "~/Library/Preferences/app.spiral.wallpaper.plist",
    "~/Library/Saved Application State/app.spiral.wallpaper.savedState",
    "~/Library/WebKit/app.spiral.wallpaper",
  ]
end
