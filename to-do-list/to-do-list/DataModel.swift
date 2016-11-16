//
//  DataModel.swift
//  to-do-list
//
//  Created by Yoon Yu on 11/15/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import Foundation
import UIKit

//class DataController {
//   
//   static let sharedInstance = DataController()
//   
//}
var lists = [List]()

class List {
   var listTitle: String
   var items = [Item]()
   
   init(listTitle: String) {
      self.listTitle = listTitle
   }
}

class Item {
   var itemTitle: String
   var description: String
   
   init(itemTitle: String, description: String) {
      self.itemTitle = itemTitle
      self.description = description
   }
}
