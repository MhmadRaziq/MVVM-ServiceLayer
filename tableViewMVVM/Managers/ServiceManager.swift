//
//  ServiceManager.swift
//  tableViewMVVM
//
//  Created by Mac on 07/10/2023.
//

import Foundation

// singleton
class ServiceManager {
  var baseURL = "https://dummyjson.com"
}


extension ServiceManager {

  func sendRequest(request: RequestModel, completion: @escaping(Result<Data,Error>)->(Void)) {


    // URLSession Request

    URLSession.shared.dataTask(with: request.prepareRequestURL()) { data,response, error in

      guard let data = data else {
        completion(.failure(error!))
        return
      }
      completion(.success(data))

//      if let httpResponse = response as? HTTPURLResponse {
//        if httpResponse.statusCode ==
//      }

    }.resume()

  }
}
