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
   
   @IBOutlet weak var ItemListNameOutlet: UILabel!
   
   @IBOutlet weak var ItemTableOutlet: UITableView!
   
   @IBOutlet weak var ItemTextFieldOutlet: UITextField!
   
   var currentItemIndex: Int!
   
   // MARK: UITableViewDataSource ----------------------------------------------------
   
   // returns the count of items in the items array
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return lists[currentItemIndex].items.count
   }
   
   // gets the cell to read data by dequeing it and grabs itemTitle from the lists array and sets it to cell's outlet
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "itemTableCell", for: indexPath) as! ItemTableViewCell
      cell.ItemTableOutlet.text = lists[currentItemIndex].items[indexPath.row].itemTitle
      return cell
   }
   
   // grabs the row and deletes the row
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         lists[currentItemIndex].items.remove(at: indexPath.row)
         ItemTableOutlet.reloadData()
      }
   }
   
   // MARK: IBAction --------------------------------------------------------------------------------------
   
   @IBAction func ItemAddBtnAction(_ sender: UIButton) {
      // Grabs text from the text field and puts it into listTextField
      let itemTextField = ItemTextFieldOutlet.text!
      // It clears the input field
      ItemTextFieldOutlet.text = ""
      // Creates an instance of List object and appends new item to the lists array
      lists[currentItemIndex].items.append(Item.init(itemTitle: itemTextField, description: ""))
      // reloads the table so that it gets new info
      ItemTableOutlet.reloadData()
   }
   
   // MARK: override ----------------------------------------------------------------------------------------
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // segue id drom list view to item view is identify as list2Item
      // let dvc (destination view controller) segue to item view controller
      let dvc = segue.destination as! DetailViewController
      // grabs the index of the list items
      dvc.currentListIndex = currentItemIndex
      // grabs the index of the row that was selected from the table outlet
      dvc.currentItemIndex = ItemTableOutlet.indexPathForSelectedRow?.row
   }
   
   // Displays list title on load
   override func viewDidLoad() {
      super.viewDidLoad()
      ItemListNameOutlet.text = lists[currentItemIndex].listTitle.uppercased()
      // Do any additional setup after loading the view.
   }
}
