//
//  Services.swift
//  tableViewMVVM
//
//  Created by Mac on 07/10/2023.
//

import Foundation

class Services {

  // get dummy data
  var serviceManager: ServiceManager

  init(serviceManager: ServiceManager) {
    self.serviceManager = serviceManager
  }

  func getDummyData(completion: @escaping(Result<ItemsResponseModel,Error>)->Void ) {
    serviceManager.sendRequest(request: ItemsRequestModel(baseURL: serviceManager.baseURL)) { result in

      switch result {
      case .success(let data):
        do {
          let items = try JSONDecoder().decode(ItemsResponseModel.self,from: data)
          completion(.success(items))
        } catch {
          print(error)
        }
      case .failure(let failure):
        completion(.failure(failure))
      }

    }
  }
}
