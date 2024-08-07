cask "bonjour-browser" do
  version "1.5.6"
  sha256 :no_check

  url "https://www.tildesoft.com/files/BonjourBrowser.dmg"
  name "Bonjour Browser"
  desc "Display all the bonjour services on your local network"
  homepage "https://www.tildesoft.com/"

  disable! date: "2023-12-17", because: "is 32-bit only."

  depends_on macos: "<= :mojave"

  app "Bonjour Browser.app"
end
