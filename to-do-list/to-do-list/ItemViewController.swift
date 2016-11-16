//
//  ItemViewController.swift
//  to-do-list
//
//  Created by Yoon Yu on 11/15/16.
//  Copyright © 2016 Grace Yu. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   // creating a new container of index
   var currentItemIndex: Int!
   
   // MARK: IBOutlet ----------------------------------------------------------------------
   
   @IBOutlet weak var ItemTableOutlet: UITableView!
   
   @IBOutlet weak var ItemTextFieldOutlet: UITextField!
   
   // MARK: UITableViewDataSource ----------------------------------------------------
   
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return lists[currentItemIndex].items.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // gets the cell to read data by dequeing it
      let cell = tableView.dequeueReusableCell(withIdentifier: "itemTableCell", for: indexPath) as! ItemTableViewCell
      // sets the indexPath
      let myRow = indexPath.row
      // gets the array's indexPath
      let itemItem = lists[currentItemIndex].items[myRow]
      // grabs itemTitle from the lists array and sets it to cell's outlet
      cell.ItemTableOutlet.text = itemItem.itemTitle
      // returns the cell
      return cell

   }
   
   // MARK: IBAction --------------------------------------------------------------------------------------
   
   @IBAction func ItemAddBtnAction(_ sender: UIButton) {
      // Grabs text from the text field and puts it into listTextField
      let itemTextField = ItemTextFieldOutlet.text!
      let descriptionStatic = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. "
      // Creates an instance of List object and inits
      let newItem = Item.init(itemTitle: itemTextField, description: descriptionStatic)
      // appends new item to the lists array
      lists[currentItemIndex].items.append(newItem)
      // reloads the table so that it gets new info
      ItemTableOutlet.reloadData()
      //ListTextFieldOutlet.reloadInputViews()
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // segue id drom list view to item view is identify as list2Item
      // let dvc (destination view controller) segue to item view controller
      let dvc = segue.destination as! DetailViewController
      // grabs the index of the row that was selected from the table outlet
      dvc.currentDetailIndex = ItemTableOutlet.indexPathForSelectedRow?.row
   }

   
   //
   override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
   }
}
