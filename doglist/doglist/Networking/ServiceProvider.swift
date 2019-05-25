//
//  ServiceProvider.swift
//  doglist
//
//  Created by Hélio Mesquita on 24/05/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Foundation

class ServiceProvider<T> where T: Decodable {

  typealias Model = T

  func execute(request: RequestProvider, onSuccess: @escaping (Model) -> Void, onError: @escaping (Error) -> Void) {
    URLSession.shared.dataTask(with: request.asURLRequest) { (data, response, _) in

      let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
      if 200...299 ~= statusCode {
        let data = data ?? Data()

        do {
          let model = try JSONDecoder().decode(Model.self, from: data)
          onSuccess(model)
        } catch {
          onError(error)
        }

      } else {
        onError(DogErrors.badRequest)
      }
    }
  }

}
