//
//  APIs.swift
//  tableViewMVVM
//
//  Created by Mac on 07/10/2023.
//

import Foundation

class APIs {
  struct Shop {
    var services: Services
    init(services: Services) {
      self.services = services
    }
    func getProducts(completion:@escaping(Result<ItemsResponseModel,Error>)->(Void)) {
      services.getDummyData() { result in
       completion(result)
      }
    }
  }
}
