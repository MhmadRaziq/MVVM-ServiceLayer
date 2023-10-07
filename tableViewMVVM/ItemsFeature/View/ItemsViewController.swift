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
      var serviceManager:ServiceManager = ServiceManager()
      var services:Services =  Services(serviceManager: serviceManager)
      itemsViewModel = ItemsViewModel( shopApi: APIs.Shop(services: services))
      itemsViewModel.itemViewModelProtocol = self
      itemsViewModel.getAllProducts()
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

extension ItemsViewController: ItemViewModelProtocol {
  func updateUI(products: [Product]) {
    DispatchQueue.main.async {
      self.itemsTableView.reloadData()
    }
  }
}
