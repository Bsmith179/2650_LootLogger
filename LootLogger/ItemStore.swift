//
//  ItemStore.swift
//  LootLogger
//  Created by Brigitte on 9/03/26
// Continuation of LootLogger Project.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(at sourceIndex: Int, to destinationIndex: Int) {
        if sourceIndex == destinationIndex {
            return
        }
        let movedItem = allItems.remove(at: sourceIndex)
        allItems.insert(movedItem, at: destinationIndex)
    }
    
//    init() {
//        for _ in 0..<50 {
//            createItem()
//        }
//    }
}
