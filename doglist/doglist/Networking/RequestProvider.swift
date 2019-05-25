//
//  RequestProvider.swift
//  doglist
//
//  Created by Hélio Mesquita on 24/05/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Foundation

protocol RequestProvider {
  var scheme: String { get }
  var host: String { get }
  var path: String { get }
  var bodyParameters: Encodable? { get }
  var queryParameters: [URLQueryItem]? { get }
  var headers: [String: String] { get }
  var httpVerb: HttpVerbs { get }
  var asURLRequest: URLRequest { get }
}

extension RequestProvider {

  var scheme: String {
    return Bundle.main.scheme
  }

  var host: String {
    return Bundle.main.host
  }

  var bodyParameters: Encodable? {
    return nil
  }

  var queryParameters: [URLQueryItem]? {
    return nil
  }

  var headers: [String: String] {
    return ["Content-Type": "application/json"]
  }

  var asURLRequest: URLRequest {
    var components = URLComponents()
    components.scheme = scheme
    components.host = host
    components.path = path
    components.queryItems = queryParameters

    var request = URLRequest(url: components.url!)
    request.httpMethod = httpVerb.rawValue
    headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }

    if let bodyParameters = bodyParameters, let data = bodyParameters.toJSONData() {
      request.httpBody = data
    }

    print(request)
    print(String(bytes: request.httpBody!, encoding: .utf8))
    return request
  }

}
