cask "eyelid" do
  version "0.9.0"
  sha256 "bc6a431289d50836b07e909a12ad69944aecc23c0b71bd9aea091ee093ed5138"

  url "https://github.com/Satis-ku/Eyelid/releases/download/v#{version}/Eyelid-#{version}.zip"
  name "Eyelid"
  desc "Dynamic Island-style notch for MacBooks"
  homepage "https://github.com/Satis-ku/Eyelid"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Eyelid.app"

  uninstall quit: "io.github.satis-ku.eyelid"

  zap trash: [
    "~/Library/Application Support/io.github.satis-ku.eyelid",
    "~/Library/Preferences/io.github.satis-ku.eyelid.plist",
  ]

  caveats <<~EOS
    Eyelid isn't notarized by Apple, so macOS blocks its first launch.
    Allow it in System Settings → Privacy & Security with "Open Anyway".

    The volume and brightness HUD needs Accessibility access. After an
    update, remove Eyelid from System Settings → Privacy & Security →
    Accessibility and allow it again.
  EOS
end
