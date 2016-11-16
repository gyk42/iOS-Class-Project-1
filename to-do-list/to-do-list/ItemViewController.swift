//
//  ItemViewController.swift
//  to-do-list
//
//  Created by Yoon Yu on 11/15/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   // MARK: IBOutlet ----------------------------------------------------------------------
   
   @IBOutlet weak var ItemTableOutlet: UITableView!
   
   @IBOutlet weak var ItemTextFieldOutlet: UITextField!
   
   @IBAction func ItemAddBtnAction(_ sender: UIButton) {
   }
   
   
   // creating a new instance of Item object with optional
   var currentItem: Item?
   
   // MARK: UITableViewDataSource ----------------------------------------------------
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      return UITableViewCell()
   }
   
   //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
