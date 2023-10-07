//
//  RequestModel.swift
//  tableViewMVVM
//
//  Created by Mac on 07/10/2023.
//



import Foundation

enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class RequestModel {

  var baseURL:String

  init(baseURL: String) {
    self.baseURL = baseURL
  }

  var path: String {
    return ""
  }
  var parameters: [String:Any?] {
    return [:]
  }
  var headers: [String:String] {
    return [:]
  }
  var body: [String:Any?] {
    return [:]
  }
  var method: String {
    return ""
  }
}

extension RequestModel {
  func prepareRequestURL() -> URLRequest {
    // prepare full url
    var endpoint = baseURL.appending(path)

    // adding params

    for parameter in parameters {
      switch parameter.value {
      case let value as String:
        endpoint.append("&\(parameter.key)=\(value)")
      case let value as Int:
        endpoint.append("&\(parameter.key)=\(value)")
      case let value as Bool:
        endpoint.append("&\(parameter.key)=\(value)")
      case let value as Double:
        endpoint.append("&\(parameter.key)=\(value)")
      case let value as [String]:
        let values = value.joined(separator: ";")
        endpoint.append("&\(parameter.key)=\(values)")
      default:
        break
      }
    }

    var request = URLRequest(url: URL(string: endpoint.replacingOccurrences(of: " ", with: "%20"))!)

    //setup method
    request.httpMethod = self.method

    //setup header
    for header in headers {
      request.addValue(header.value, forHTTPHeaderField: header.key)
    }

    // setup body

    if method == "POST" || method == "PUT" {
      do {
        request.httpBody = try JSONSerialization.data(withJSONObject: body,options: JSONSerialization.WritingOptions.prettyPrinted)
      } catch {
        print(error)
      }
    }
    return request
  }
}
