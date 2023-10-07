//
//  ItemViewModel.swift
//  tableViewMVVM
//
//  Created by Mac on 06/10/2023.
//

import Foundation

class ItemViewModel {

  let item: Item

  init(item: Item) {
    self.item = item
  }

  var title: String {
    return self.item.title
  }

  var subtitle: String {
    return self.item.subtitle
  }
}
