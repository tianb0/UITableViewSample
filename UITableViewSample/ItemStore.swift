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
}
