cask "spiral-resume" do
  version "0.1.2"
  sha256 "ec98b839c5e227e09395b73cbcf652b3cff23a78d0ff9d72abdc536972605638"

  url "https://github.com/cococool13/spiral/releases/download/resume-v#{version}/Spiral.Resume_#{version}_universal.dmg",
      verified: "github.com/cococool13/spiral/"
  name "Spiral Resume"
  desc "Typeset a resume as PDF or Word without changing any fact"
  homepage "https://spiralcc.tech/"

  # Same repo as Wallpaper. Default GitHub livecheck follows v* tags.
  livecheck do
    url :url
    regex(/^resume[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  depends_on macos: :ventura

  app "Spiral Resume.app"

  zap trash: [
    "~/Library/Application Support/app.spiral.resume",
    "~/Library/Caches/app.spiral.resume",
    "~/Library/Preferences/app.spiral.resume.plist",
    "~/Library/Saved Application State/app.spiral.resume.savedState",
    "~/Library/WebKit/app.spiral.resume",
  ]
end
