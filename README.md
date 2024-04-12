# 🎨 Xcode Themes

This repo contains the Xcode theme that I use. There's a couple `Tokyo Night` variations based on how they look in VSCode. `Tokyo Night Redlight` is my own take on Tokyo Night that focuses on more red. 

## Installing via SPM
The easiest way to install these themes is to clone this repo and execute `swift run`: 

```
$ git clone https://github.com/ddh4r4m/XcodeTheme.git
$ cd XcodeTheme
$ swift run
```

This will install [JetBrains Mono](https://www.jetbrains.com/lp/mono/) font and the Xcode themes for you. Afterward, you can remove the downloaded folder: 

```
$ cd ..
$ rm -rf XcodeThemes
```

## Installing Manually
You can also do this manually (but why):
1. Clone the repo: 
```
$ git clone https://github.com/ddh4r4m/xcodetheme.git
```
2. Create a folder at this path if it doesn't exist already:
```
~/Library/Developer/Xcode/UserData/FontAndColorThemes
```
3. Copy one or more of the `*.xccolortheme` into the above folder.
4. Download the latest release of JetBrains Mono from their [repo](https://github.com/JetBrains/JetBrainsMono)
5. Unzip the font archive and move the files in the `ttf` folder to `~/Library/Fonts`
6. Realize you should have just used the install script 😉
