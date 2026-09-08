cask "portero" do
  version "0.1.0"
  sha256 "865bc00513059891d1db4cf3486154774e7e1c099c14805f20e919d1c637b241"

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
