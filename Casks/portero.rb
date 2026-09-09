cask "portero" do
  version "0.2.1"
  sha256 "1aecfd73ef1db64db32b53bc6f61b1a97702060072f8013d5267d02c55aa64ff"

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
