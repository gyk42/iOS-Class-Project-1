//
//  DetailViewController.swift
//  to-do-list
//
//  Created by Yoon Yu on 11/15/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
   var currentListIndex: Int!
   var currentItemIndex: Int!
   
   @IBOutlet var detailViewPageOutlet: UIView!
   
   @IBOutlet weak var yourListOutlet: UILabel!
   
   @IBOutlet weak var yourItemOutlet: UILabel!
   
   @IBOutlet weak var yourDescriptionOutlet: UILabel!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      yourListOutlet.text = lists[currentListIndex].listTitle
      yourItemOutlet.text = lists[currentListIndex].items[currentItemIndex].itemTitle
      yourDescriptionOutlet.text = lists[currentListIndex].items[currentItemIndex].description
      
      //yourListOutlet.text = lists[currentItemIndex].listTitle
      // Do any additional setup after loading the view.
   }
   
   
   
   
   
}
