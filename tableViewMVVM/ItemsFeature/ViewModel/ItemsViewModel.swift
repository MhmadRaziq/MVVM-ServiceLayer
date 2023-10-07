//
//  ItemsViewModel.swift
//  tableViewMVVM
//
//  Created by Mac on 06/10/2023.
//

import Foundation

protocol ItemViewModelProtocol {
  func updateUI(products: [Product])
}

class ItemsViewModel {
  var itemsResponseModel: ItemsResponseModel?
  var itemViewModelProtocol:  ItemViewModelProtocol?
  var shopApi: APIs.Shop
  init(itemsResponseModel: ItemsResponseModel? = nil, itemViewModelProtocol: ItemViewModelProtocol? = nil, shopApi: APIs.Shop) {
    self.itemsResponseModel = itemsResponseModel
    self.itemViewModelProtocol = itemViewModelProtocol
    self.shopApi = shopApi
  }
  func getAllProducts() {
    shopApi.getProducts() { [self] result in
      switch result {
      case .success(let itemsResponseModel):
        //update ui
        self.itemsResponseModel = itemsResponseModel
        itemViewModelProtocol?.updateUI(products: itemsResponseModel.products)
      case .failure(let failure):
        print(failure)
      }
    }
  }
  func numberOfItems() -> Int {
    if let prods = itemsResponseModel?.products {
      return prods.count
    } else {
      return 0
    }
  }
  func itemFromIndex(at index: Int) -> ItemViewModel {
    return ItemViewModel(item: self.itemsResponseModel!.products[index])
  }
}
