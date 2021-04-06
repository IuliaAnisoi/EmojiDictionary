//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Anisoi Iulia Roxana on 17.03.2021.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("emoji_test")
        .appendingPathExtension("plist")
    
    static func saveToFile(emojis: [Emoji]) {
        let encodedEmojis = try?  PropertyListEncoder().encode(emojis)
        
        try? encodedEmojis?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Emoji]? {
        guard let retrievedEmojisData = try? Data(contentsOf: archiveURL),
              let decodedEmojis = try? PropertyListDecoder().decode(Array<Emoji>.self, from: retrievedEmojisData)
        else { return nil }
        
        return decodedEmojis
    
    }
    
    static func sampleEmojis () -> [Emoji] {
        let emojis: [Emoji] = [
            Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face", usage: "unsure what to think; displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes", usage: "love of something; attractive"),
            Emoji(symbol: "👩‍💻", name: "Developer", description: "A person working on a MacBook (probably using Xcode to write iOS apps in Swift", usage: "apps, software, programming"),
            Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle", usage: "something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant", usage: "good memory"),
            Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti", usage: "spaghetti"),
            Emoji(symbol: "🎲", name: "Die", description: "A dingle die", usage: "taking a risk, chance; game"),
            Emoji(symbol: "🏕", name: "Tent", description: "A small tent", usage: "camping"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other", usage: "homework, studying"),
            Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart", usage: " extreme sadness"),
            Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s", usage: "tired, sleepiness"),
            Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag", usage: "completion"),
            Emoji(symbol: "😞", name: "Sad Face", description: "A sad face", usage: "sadness"),
            Emoji(symbol: "🦆", name: "Duck", description: "A duck with green, black and white feathers", usage: "rivers and lakes"),
            Emoji(symbol: "🥝", name: "Kiwi", description: "A ripe kiwi", usage: "vitamin C")
        ]
        
        return emojis
    }
}
