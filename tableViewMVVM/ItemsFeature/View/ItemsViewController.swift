//
//  ItemsViewController.swift
//  tableViewMVVM
//
//  Created by Mac on 06/10/2023.
//

import UIKit

class ItemsViewController: UIViewController {

  @IBOutlet weak var itemsTableView: UITableView!
  
  var itemsViewModel: ItemsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
      let sampleData = [
          Item(title: "Item 1", subtitle: "Description for Item 1"),
          Item(title: "Item 2", subtitle: "Description for Item 2"),
          Item(title: "Item 3", subtitle: "Description for Item 3")
      ]
      itemsViewModel = ItemsViewModel(items: sampleData)
    }
}


extension ItemsViewController: UITableViewDelegate , UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemsViewModel.numberOfItems()
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",for: indexPath)
    let item = itemsViewModel.itemFromIndex(at: indexPath.row)
    cell.textLabel?.text = item.title
    cell.detailTextLabel?.text = item.subtitle
   return cell
  }


}
