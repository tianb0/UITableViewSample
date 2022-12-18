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
    
    // Init with a few random items
    init() {
        for _ in 0..<10 {
            createOne()
        }
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
}
