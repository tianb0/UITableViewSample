//
//  ItemStore.swift
//  UITableViewSample
//
//  Created by Tianbo Qiu on 11/20/22.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let item = Item(random: true)
        allItems.append(item)
        return item
    }
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
}
