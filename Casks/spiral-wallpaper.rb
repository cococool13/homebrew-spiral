cask "spiral-wallpaper" do
  version "1.0.3"
  sha256 "993f029e0c0774d333624c35c4ff4cae65c3680d7a4e8078eddbba152ba1b734"

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
