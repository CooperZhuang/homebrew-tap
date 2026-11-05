# homebrew-tap

```bash
brew install --cask CooperZhuang/tap/clockclock
brew upgrade --cask clockclock          # 升级
brew uninstall --cask clockclock        # 卸载（会先退出 App）
brew uninstall --zap --cask clockclock  # 连设置、登录项一起清掉
```

[ClockClock](https://github.com/CooperZhuang/clockclock-24) —— 用 36 个表盘 / 72 根指针拼时间的菜单栏时钟。

## 为什么走 brew 就不会弹「无法验证开发者」

包本身还是 ad-hoc 签名、没做苹果公证。Homebrew 下载的 cask 默认会带 `com.apple.quarantine` 标记，留着它首次打开就会被 Gatekeeper 拦；这个 cask 在 `postflight` 里把标记抹掉（等价于 `brew install --cask --no-quarantine`），所以装完直接可用。

装完可以自己确认：

```bash
xattr -p com.apple.quarantine /Applications/ClockClock.app   # 应该报 No such xattr
```
