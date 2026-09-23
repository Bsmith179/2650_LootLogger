//
//  Item.swift
//  LootLogger
//  Created by Brigitte on 9/03/26
// Continuation of LootLogger Project.
//

import UIKit

class Item: Equatable, Codable {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    var dateCreated: Date
    
    init(name: String, serialNumber: String? = nil, valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
        && lhs.serialNumber == rhs.serialNumber
        && lhs.valueInDollars == rhs.valueInDollars
        && lhs.dateCreated == rhs.dateCreated
    }
    
    convenience init(random: Bool = false) {
        if random {
            let adjectives = ["Shiny", "Dull", "Fancy", "Old", "New", "Cozy", "Hot", "Cold", "Bright", "Dark"]
            let nouns = ["Sword", "Shield", "Potion", "Ring", "Sword", "Boots", "Helmet", "Cape", "Axe", "Bow"]
            
            let randomAdjective = adjectives.randomElement()!
            let randomNoun = nouns.randomElement()!
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int.random(in: 0..<100)
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
    
}
