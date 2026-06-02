#!/bin/bash

USER_LIST=$(ls /Users)
for USER in ${USER_LIST};
do
echo "Working in $USER directory..."
if [[ ($USER != "EXCEPTIONUSER") && ($USER != "Shared") && ($USER != "Guest") && ($USER != ".localized") ]]
then
##Add to all users except EXCEPTIONS and Shared code here
su "$USER" -c "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true"
su "$USER" -c "defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1"
su "$USER" -c "defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1"
else
echo "...skipping"
fi
done
exit 0

# TODO three finger drag script. System Settings -> Accessibility -> Pointer Control -> Trackpad Options -> Enable dragging -> three finger drag
# TODO tap to click script. System Settings -> trackpad -> Point & Click -> Tap to click
# TODO secondary click script. System Settings -> trackpad -> Point & Click -> Secondary click
# TODO mac lock screen script. System Settings -> lock screen
# TODO show HD drive on desktop. finder -> settings -> show HD drive
# TODO finder. show all file extensions. finder -> settings -> advance -> show all file extensions
# TODO finder. show hidden files. cmd + shift + . or defaults write com.apple.finder AppleShowAllFiles True; killall Finder
# replace shortcut for raycast by disable spotlight. "system setting" -> "keyboard shortcut" -> "spotlight"
# Disable Spotlight search shortcut
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/></dict>" # disable
killall SystemUIServer # login/out
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><true/></dict>" # re-enable
# defaults write com.apple.finder AppleShowAllFiles False; killall Finder
# Those will unhide all, for individual files paste       sudo chflags nohidden
# show / turn off dock: command + option + d
