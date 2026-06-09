
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
#defaults write /Library/Preferences/com.apple.airport.bt.plist bluetoothCoexMgmt Hybrid

# Move Screenshots folders
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots
killall SystemUIServer

# Dock Settings
defaults write com.apple.dock orientation left
defaults write com.apple.Dock autohide 1
defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock autohide-time-modifier -float 0.15


# Add my Screenshot folder to the dock
if ! defaults read com.apple.dock persistent-others | grep -q "Screenshots"; then
defaults write com.apple.dock persistent-others -array-add '
<dict>
    <key>GUID</key>
    <integer>0</integer>
    <key>tile-data</key>
    <dict>
        <key>arrangement</key>
        <integer>2</integer>
        <key>displayas</key>
        <integer>0</integer>
        <key>file-data</key>
        <dict>
            <key>_CFURLString</key>
            <string>/Users/'$USER'/Pictures/Screenshots</string>
            <key>_CFURLStringType</key>
            <integer>0</integer>
        </dict>
        <key>showas</key>
        <integer>2</integer>
    </dict>
    <key>tile-type</key>
    <string>directory-tile</string>
</dict>'
fi
killall Dock
