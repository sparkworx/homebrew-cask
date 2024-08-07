cask "gitfiend" do
  arch arm: "-arm64"

  version "0.44.3"
  sha256 arm:   "524f4b00b4819b5fdf2d453fd8947dee5045b68ab832d175123c8274048e1e98",
         intel: "ad06ff9c0247993a9ec9aa4bb93b880662097742072cd4ff1cc302b621e4cadc"

  url "https://gitfiend.com/resources/GitFiend-#{version}#{arch}.dmg"
  name "GitFiend"
  desc "Git client"
  homepage "https://gitfiend.com/"

  livecheck do
    url "https://gitfiend.com/app-info"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "GitFiend.app"
  # shim script (https://github.com/Homebrew/homebrew-cask/issues/18809)
  shimscript = "#{staged_path}/gitfiend.wrapper.sh"
  binary shimscript, target: "gitfiend"

  preflight do
    File.write shimscript, <<~EOS
      #!/bin/sh
      exec '#{appdir}/GitFiend.app/Contents/MacOS/GitFiend' "$@"
    EOS
  end

  zap trash: [
    "~/Library/Application Support/GitFiend",
    "~/Library/Preferences/com.tobysuggate.gitfiend.plist",
    "~/Library/Saved Application State/com.tobysuggate.gitfiend.savedState",
  ]
end
