//
//  DogPhotoListProvider.swift
//  doglist
//
//  Created by Hélio Mesquita on 25/05/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Foundation

class DogPhotoListProvider: RequestProvider {

  var breed: DogBreedsList.Breeds
  var token: String

  var path: String {
    return "/feed"
  }

  var httpVerb: HttpVerbs {
    return .GET
  }

  var queryParameters: [URLQueryItem]? {
    return [URLQueryItem(name: "category", value: breed.rawValue)]
  }

  var headers: [String: String] {
    return [
      "Content-Type": "application/json",
      "Authorization": token
    ]
  }

  init(session: Login.Session) {
    self.breed = session.breed
    self.token = session.token
  }

}
