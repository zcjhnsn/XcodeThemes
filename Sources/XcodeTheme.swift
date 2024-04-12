import Foundation
import Files
import ShellOut

@main
struct XcodeTheme {
    static func main() throws {
        let fontsFolder = try Folder.home.subfolder(at: "Library/Fonts")

        if !fontsFolder.containsFile(named: "JetBrainsMono-Regular.ttf") {
            print("⏳ Downloading JetBrainsMono font...")

            let fontZipURL = URL(string: "https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip")!
            let fontZipData = try Data(contentsOf: fontZipURL)

            print("🔠 Installing JetBrainsMono font...")

            let fontZipFile = try fontsFolder.createFile(named: "JetBrainsMono.zip", contents: fontZipData)
            try shellOut(to: "unzip \(fontZipFile.name) -d JetBrainsMono", at: fontsFolder.path)

            let jetBrainsMonoFolder = try fontsFolder.subfolder(named: "JetBrainsMono")
            let ttfFolder = try jetBrainsMonoFolder.subfolder(at: "fonts/ttf")
            try ttfFolder.files.move(to: fontsFolder)

            try jetBrainsMonoFolder.delete()
            try fontZipFile.delete()

            print("✅ Installed JetBrainsMono font!")
        }

        print("🎨 Installing Xcode themes...")

        // Go to Themes folder
        let themesFolder = try Folder.current.subfolder(named: "Themes")

        // Get all .xccolortheme files in the Themes folder
        let themeFiles = themesFolder.files.filter { $0.extension == "xccolortheme" }

        let xcodeFolder = try Folder.home.subfolder(at: "Library/Developer/Xcode")
        let userDataFolder = try xcodeFolder.createSubfolderIfNeeded(withName: "UserData")
        let themeFolder = try userDataFolder.createSubfolderIfNeeded(withName: "FontAndColorThemes")

        for themeFile in themeFiles {
            let themeData = try themeFile.read()
            let themeDestination = try themeFolder.createFileIfNeeded(withName: themeFile.name)
            try themeDestination.write(themeData)
            print("🎉 \(themeFile.name) successfully installed")
        }

        print("")
        print("🎉 Themes successfully installed")
        print("⚠️ Be sure to select the theme in Xcode's settings. You may need to restart Xcode for them to show in the list.")
    }
}
