//
//  ItemStore.swift
//  LootLogger
//  Created by Brigitte on 9/03/26
// Continuation of LootLogger Project.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    let itemArchiveURL: URL = {
        let documentsDirectories =
            FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.plist")
    }()
    
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
    
    @objc func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL)")
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(allItems)
            try data.write(to: itemArchiveURL, options: [.atomic])
            print("Saved all of the items")
            return true
        } catch let encodingError {
            print("Error encoding allItems: \(encodingError)")
            return false
    }

    }

    init() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(saveChanges),
                                       name: UIScene.didEnterBackgroundNotification,
                                       object: nil)
    }
    
    
//    init() {
//        for _ in 0..<50 {
//            createItem()
//        }
//    }
    
}
