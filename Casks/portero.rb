cask "portero" do
  version "0.2.0"
  sha256 "68eba7f13dd0fba57ffd93aecba9860770b44eda224093594e1aae751b3006c5"

  url "https://github.com/sisques-labs/portero/releases/download/v#{version}/Portero-v#{version}.app.zip"
  name "Portero"
  desc "Menu bar app to see and kill processes listening on network ports"
  homepage "https://github.com/sisques-labs/portero"

  app "Portero.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-dr", "com.apple.quarantine", "#{appdir}/Portero.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.sisqueslabs.portero.plist",
  ]
end
