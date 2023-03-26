# Show hidden files
defaults write com.apple.finder appleshowallfiles true
# Change default screen location
defaults write com.apple.screencapture location /Users/romain/Pictures/screens
# Allow key repeating
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# Note: delete '.ce' if it's not the community edition
defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false
# Anki
defaults write net.ankiweb.dtop NSAppSleepDisabled -bool true
defaults write net.ichi2.anki NSAppSleepDisabled -bool true
defaults write org.qt-project.Qt.QtWebEngineCore NSAppSleepDisabled -bool true
