//
//  DataModel.swift
//  to-do-list
//
//  Created by Yoon Yu on 11/15/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import Foundation
import UIKit

class Model {
   static let shared = Model()
   private init() {}
   
   let key = "todoList"
   
   func persistListToDefaults() {
      let data = NSKeyedArchiver.archivedData(withRootObject: lists)
      UserDefaults.standard.set(data, forKey: key)
   }
   
   func loadPersistedListFromDefaults() {
      if let data = UserDefaults.standard.object(forKey: key) as? Data {
         let listOfItems = NSKeyedUnarchiver.unarchiveObject(with: data) as! [List]
         lists = listOfItems
      }
   }
}

var lists = [List]()

class List: NSObject, NSCoding {
   
   private struct Keys {
      static let listTitle = "listTittle"
      static let items = "items"
   }
   
   var listTitle: String
   var items = [Item]()
   
   init(listTitle: String) {
      self.listTitle = listTitle
   }
   
   required init?(coder aDecoder: NSCoder) {
      listTitle = aDecoder.decodeObject(forKey: Keys.listTitle) as! String
      items = aDecoder.decodeObject(forKey: Keys.items) as! [Item]
   }
   
   func encode(with aCoder: NSCoder) {
      aCoder.encode(listTitle, forKey: Keys.listTitle)
      aCoder.encode(items, forKey: Keys.items)
   }
}

class Item: NSObject, NSCoding {
   
   private struct Keys {
      static let itemTitle = "itemTitle"
      static let description1 = "description1"
   }
   
   var itemTitle: String
   var description1 = "description"
   
   init(itemTitle: String, description1: String) {
      self.itemTitle = itemTitle
      self.description1 = description1
   }
   
   required convenience init?(coder aDecoder: NSCoder) {
      self.init(
         itemTitle: aDecoder.decodeObject(forKey: Keys.itemTitle) as! String,
         description1: aDecoder.decodeObject(forKey: Keys.description1) as! String
      )
   }
   
   func encode(with aCoder: NSCoder) {
      aCoder.encode(itemTitle, forKey: Keys.itemTitle)
      aCoder.encode(description1, forKey: Keys.description1)
   }
}
