//
//  ListViewController.swift
//  to-do-list
//
//  Created by Yoon Yu on 11/15/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   let cellID = "listTableCell"
   
   // MARK: IBOutlet ----------------------------------------------------------------------
   
   @IBOutlet weak var ListTableOutlet: UITableView!
   
   @IBOutlet weak var ListTextFieldOutlet: UITextField!
   
   @IBAction func listAddBtnAction(_ sender: UIButton) {
   
   }
   
   // MARK: UITableViewDataSource ----------------------------------------------------------------------
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if DataController.sharedInstance.Lists.count <= 1 {
         return 1
      } else {
         return DataController.sharedInstance.Lists.count
      }
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListTableViewCell
   
      let myRow = indexPath.row
      
      let listItem = DataController.sharedInstance.Lists[myRow]
      
      cell.listLabelOutlet.textInputMode = listItem.items
      
      return cell
      
   }
   
   
   
   //
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }
}

