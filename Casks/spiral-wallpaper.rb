cask "spiral-wallpaper" do
  version "2.0.2"
  sha256 "330fd5383dbbf81dd2847320fa43be27136f50a0e7e71fe86927021b0efe6b22"

  url "https://github.com/cococool13/spiral/releases/download/v#{version}/Spiral_#{version}_universal.dmg",
      verified: "github.com/cococool13/spiral/"
  name "Spiral"
  desc "Set wallpapers and typeset resumes in one app"
  homepage "https://spiralcc.tech/"

  depends_on macos: :ventura

  app "Spiral.app"

  # Everything the app writes lives under its bundle identifier.
  zap trash: [
    "~/Library/Application Support/app.spiral.wallpaper",
    "~/Library/Caches/app.spiral.wallpaper",
    "~/Library/Preferences/app.spiral.wallpaper.plist",
    "~/Library/Saved Application State/app.spiral.wallpaper.savedState",
    "~/Library/WebKit/app.spiral.wallpaper",
  ]
end
