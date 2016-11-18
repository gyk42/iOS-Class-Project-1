//
//  ListViewController.swift
//  to-do-list
//
//  Created by Yoon Yu on 11/15/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
   // MARK: IBOutlet --------------------------------------------------------------------------------------
   
   @IBOutlet weak var ListTableOutlet: UITableView!
   
   @IBOutlet weak var ListTextFieldOutlet: UITextField!
   
   
   // MARK: UITableViewDataSource --------------------------------------------------------------------------
   
   // returns the count of items in the lists array
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return lists.count
   }
   
   // gets the cell to read data by dequeing it and grabs listTitle from the lists array and sets it to cell's outlet
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "listTableCell", for: indexPath) as! ListTableViewCell
      cell.listTableCellOutlet.text = lists[indexPath.row].listTitle.uppercased()
      return cell
   }
   
   // grabs the row and deletes the row
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
         lists.remove(at: indexPath.row)
         ListTableOutlet.reloadData()
      }
   }
   
   // MARK: IBAction ---------------------------------------------------------------------------------------
   
   @IBAction func listAddBtnAction(_ sender: UIButton) {
      // Grabs text from the text field and puts it into listTextField
      let listTextField = ListTextFieldOutlet.text!
      // It clears the input field
      ListTextFieldOutlet.text = ""
      // Creates an instance of List object and appends new item to the lists array
      lists.append(List.init(listTitle: listTextField))
      // reloads the table so that it gets new info
      ListTableOutlet.reloadData()
   }
   
   // MARK: override ----------------------------------------------------------------------------------------
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // segue id drom list view to item view is identify as list2Item
      // let dvc (destination view controller) segue to item view controller
      let dvc = segue.destination as! ItemViewController
      // grabs the index of the row that was selected from the table outlet
      dvc.currentItemIndex = ListTableOutlet.indexPathForSelectedRow?.row
   }
   
   override func viewWillAppear(_ animated: Bool) {
      ListTableOutlet.reloadData()
   }
}

