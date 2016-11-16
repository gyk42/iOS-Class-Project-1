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
   
   
   // MARK: UITableViewDataSource --------------------------------------------------------
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // returns the count of items in the lists array
      return lists.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // gets the cell to read data by dequeing it
      let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListTableViewCell
      // sets the indexPath
      let myRow = indexPath.row
      // gets the array's indexPath
      let listItem = lists[myRow]
      // grabs listTitle from the lists array and sets it to cell's outlet
      cell.listTableCellOutlet.text = listItem.listTitle
      // returns the cell
      return cell
   }
   
   // MARK: IBAction ----------------------------------------------------------------------
   
   @IBAction func listAddBtnAction(_ sender: UIButton) {
      // Grabs text from the text field and puts it into listTextField
      let listTextField = ListTextFieldOutlet.text!
      // Creates an instance of List object and inits
      let newList = List.init(listTitle: listTextField)
      // appends new item to the lists array
      lists.append(newList)
      // reloads the table so that it gets new info
      ListTableOutlet.reloadData()
      //ListTextFieldOutlet.reloadInputViews()
   }
   
   // MARK: override ----------------------------------------------------------------
   
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
   
   //
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
   }
}

