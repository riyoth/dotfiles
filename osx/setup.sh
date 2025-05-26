
# Hot Corner configuration
# Reference: https://blog.jiayu.co/2018/12/quickly-configuring-hot-corners-on-macos/
# Set [b]ottom [r]igth corner to lock [13] the screen
defaults write com.apple.dock wvous-br-corner -int 13
# Set the modifier to CMD [1048576]
defaults write com.apple.dock wvous-br-modifier -int 1048576

# Mouse Settings
defaults write -g com.apple.mouse.scaling  5.0
defaults write -g com.apple.swipescrolldirection -boolean NO

# Fix lag with wireless mouse and headphone
defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid

# Dock Settings
defaults write com.apple.dock orientation left
defaults write com.apple.Dock autohide 1
defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock autohide-time-modifier -float 0.15
killall Dock
