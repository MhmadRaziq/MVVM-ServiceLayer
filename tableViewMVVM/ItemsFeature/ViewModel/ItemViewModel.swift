//
//  ItemViewModel.swift
//  tableViewMVVM
//
//  Created by Mac on 06/10/2023.
//

import Foundation

class ItemViewModel {
  let item: Product
  init(item: Product) {
    self.item = item
  }
  var title: String {
    return self.item.title
  }
  var subtitle: String {
    return self.item.category
  }
}
