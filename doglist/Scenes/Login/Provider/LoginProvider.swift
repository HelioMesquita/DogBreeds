//
//  LoginProvider.swift
//  doglist
//
//  Created by Hélio Mesquita on 25/05/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Foundation

class LoginProvider: RequestProvider {

  var emailEncodable: Login.BodyRequest

  var path: String {
    return "/signup"
  }

  var httpVerb: HttpVerbs {
    return .POST
  }

  var bodyParameters: Encodable? {
    return emailEncodable
  }

  init(emailEncodable: Login.BodyRequest) {
    self.emailEncodable = emailEncodable
  }

}
