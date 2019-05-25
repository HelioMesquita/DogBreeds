//
//  DogErrors.swift
//  doglist
//
//  Created by Hélio Mesquita on 24/05/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Foundation

enum DogErrors: Error, LocalizedError {
  case badRequest

  var localizedDescription: String {
    switch self {
    case .badRequest:
      return "Aconteceu um erro, tente novamente"
    }
  }
}
