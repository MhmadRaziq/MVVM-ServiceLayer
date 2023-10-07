//
//  ItemsRequestModel.swift
//  tableViewMVVM
//
//  Created by Mac on 07/10/2023.
//

import Foundation

class ItemsRequestModel: RequestModel {

  override var method: String {
    return RequestHTTPMethod.get.rawValue
  }

  override var path: String {
    return "/products"
  }

}
