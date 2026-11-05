cask "clockclock" do
  version "1.2.1"
  sha256 "0fa62c4e57ad736d96edeb58b8471f64092b581a088841b2ade4b2b1e5f52d25"

  url "https://github.com/CooperZhuang/clockclock-24/releases/download/v#{version}/ClockClock-#{version}.dmg"
  name "ClockClock"
  desc "Menu bar clock drawn with 72 tiny clock hands"
  homepage "https://github.com/CooperZhuang/clockclock-24"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "ClockClock.app"

  # Homebrew 下载的 cask 会被打上 quarantine 标记；这个包是 ad-hoc 签名、没公证，
  # 留着标记用户首次打开就会被 Gatekeeper 拦，这里装完抹掉（等同于 --no-quarantine）
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/ClockClock.app"]
  end

  uninstall quit: "com.cooper.clockclock-menubar"

  zap trash: [
    "~/Library/Preferences/com.cooper.clockclock-menubar.plist",
    "~/Library/LaunchAgents/com.cooper.clockclock-menubar.plist",
  ]
end
