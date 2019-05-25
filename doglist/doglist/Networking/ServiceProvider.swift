//
//  ServiceProvider.swift
//  doglist
//
//  Created by Hélio Mesquita on 24/05/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Foundation
import PromiseKit

class ServiceProvider {


  func execute<T: Decodable>(request: RequestProvider, parser: T.Type) -> Promise<T> {
    return Promise<T> { seal in
      URLSession.shared.dataTask(with: request.asURLRequest) { (data, response, _) in

        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
        if 200...299 ~= statusCode {
          let data = data ?? Data()

          do {
            let model = try JSONDecoder().decode(T.self, from: data)
            seal.fulfill(model)
          } catch {
            seal.reject(error)
          }

        } else {
          seal.reject(DogErrors.badRequest)
        }
      }.resume()
    }
  }
}
