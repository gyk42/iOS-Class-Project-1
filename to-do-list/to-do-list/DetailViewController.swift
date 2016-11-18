//
//  DetailViewController.swift
//  to-do-list
//
//  Created by Yoon Yu on 11/15/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
   // MARK: IBOutlet --------------------------------------------------------------------------------------
   
   @IBOutlet var detailViewPageOutlet: UIView!
   
   @IBOutlet weak var yourListOutlet: UILabel!
   
   @IBOutlet weak var yourItemOutlet: UILabel!
   
   @IBOutlet weak var yourDescriptionTextFieldOutlet: UITextField!

   // Variables from segue so that page can access indes from both list and item
   var currentListIndex: Int!
   var currentItemIndex: Int!
   
   // MARK: IBAction -------------------------------------------------------------------------------------
   
   // Saves description and displays it on the page
   @IBAction func tappedSaveBtnAction(_ sender: Any) {
      lists[currentListIndex].items[currentItemIndex].description = yourDescriptionTextFieldOutlet.text!
      yourDescriptionTextFieldOutlet.backgroundColor = UIColor.clear
   }
   
   // MARK: override ----------------------------------------------------------------------------------------
   
   // Displays list title, item title and description on load
   override func viewDidLoad() {
      super.viewDidLoad()
      yourListOutlet.text = lists[currentListIndex].listTitle.uppercased()
      yourItemOutlet.text = lists[currentListIndex].items[currentItemIndex].itemTitle
      yourDescriptionTextFieldOutlet.text = lists[currentListIndex].items[currentItemIndex].description
   }
}
