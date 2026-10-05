cask "eyelid" do
  version "0.5.0"
  sha256 "5fd40a99fa710b501a13487264d92bd8576861ce86e43601f462a127799d7424"

  url "https://github.com/Nikita19329/Eyelid/releases/download/v#{version}/Eyelid-#{version}.zip"
  name "Eyelid"
  desc "Dynamic Island-style notch for MacBooks"
  homepage "https://github.com/Nikita19329/Eyelid"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Eyelid.app"

  uninstall quit: "io.github.nikita19329.eyelid"

  zap trash: [
    "~/Library/Application Support/io.github.nikita19329.eyelid",
    "~/Library/Preferences/io.github.nikita19329.eyelid.plist",
  ]

  caveats <<~EOS
    Eyelid isn't notarized by Apple, so macOS blocks its first launch.
    Allow it in System Settings → Privacy & Security with "Open Anyway".

    The volume and brightness HUD needs Accessibility access. After an
    update, remove Eyelid from System Settings → Privacy & Security →
    Accessibility and allow it again.
  EOS
end
