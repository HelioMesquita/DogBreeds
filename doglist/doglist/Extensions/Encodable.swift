//
//  Encodable.swift
//  doglist
//
//  Created by Hélio Mesquita on 25/05/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Foundation

extension Encodable {

  func toJSONData() -> Data? {
    return try? JSONEncoder().encode(self)
  }

}
