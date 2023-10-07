//
//  ItemsViewModel.swift
//  tableViewMVVM
//
//  Created by Mac on 06/10/2023.
//

import Foundation


class ItemsViewModel {
  let items: [Item]
  init(items: [Item]) {
    self.items = items
  }
  func numberOfItems() -> Int{
    return items.count
  }
  func itemFromIndex(at index: Int) -> ItemViewModel {
    return ItemViewModel(item: items[index])
  }
}
