//
//  ItemStore.swift
//  NavigationView
//
//  Created by Tianbo Qiu on 12/18/22.
//

import UIKit

// Stores a list of items.
class ItemStore {
    var items = [Item]()
    
    let itemArchiveURL: URL = {
        let documentDirs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDir = documentDirs.first!
        return documentDir.appendingPathComponent("items.plist")
    }()
    
    // Init with a few random items
    init() {
        do {
            let data = try Data(contentsOf: itemArchiveURL)
            let unarchiver = PropertyListDecoder()
            let items = try unarchiver.decode([Item].self, from: data)
            self.items = items
        } catch {
            print("Error reading in saved items: \(error)")
        }
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(saveChanges),
                                       name: UIScene.didEnterBackgroundNotification,
                                       object: nil)
        
//        for _ in 0..<10 {
//            createOne()
//        }
    }
    
    // Creates a random item
    @discardableResult func createOne() -> Item {
        let item = Item()
        items.append(item)
        return item
    }
    
    // Removes one from items
    func removeOne(_ item: Item) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    // Moves the item at `fromIndex` to the position before `toIndex`
    func move(from fromIndex: Int, to toIndex: Int) {
        guard fromIndex != toIndex else { return }
        guard fromIndex >= 0, fromIndex < items.count else { return }
        guard toIndex >= 0, toIndex < items.count else { return }
        
        let item = items.remove(at: fromIndex)
        items.insert(item, at: toIndex)
    }
    
    @objc func saveChanges() -> Bool {
        print("Saving items to \(itemArchiveURL)")
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(items)
            try data.write(to: itemArchiveURL, options: [.atomic])
            print("Saved all of the items")
            return true
        } catch let encodingError {
            print("Error encoding items: \(encodingError)")
            return false
        }
    }
}
