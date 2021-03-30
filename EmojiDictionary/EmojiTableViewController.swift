//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Anisoi Iulia Roxana on 17.03.2021.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = [
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        let emoji = emojis[indexPath.row]
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = emoji.description
        
        cell.showsReorderControl = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        print("\(emoji.symbol) \(indexPath)")
    }

    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}
