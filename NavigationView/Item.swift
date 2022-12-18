//
//  Item.swift
//  NavigationView
//
//  Created by Tianbo Qiu on 12/18/22.
//

import UIKit

class Item: Equatable {
    var name: String
    var value: Int
    var uid: String
    var createdAt: Date
    
    init(name: String, value: Int) {
        self.name = name
        self.value = value
        self.uid = UUID().uuidString
        self.createdAt = Date()
    }
    
    // create an instance with random name and value
    convenience init() {
        let words1 = ["Machine", "C++", "The Art of", "Atomic"]
        let words2 = ["Learning", "Crash Course", "Algorithm Design", "Musashi"]
        let name = "\(words1.randomElement()!) \(words2.randomElement()!)"
        let value = Int.random(in: 0..<10000)
        self.init(name: name, value: value)
    }
    
    static func==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name && lhs.value == rhs.value && lhs.uid == rhs.uid && lhs.createdAt == rhs.createdAt
    }
}
