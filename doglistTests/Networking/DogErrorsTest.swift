//
//  DogErrorsTest.swift
//  doglistTests
//
//  Created by Hélio Mesquita on 25/05/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Cuckoo
import Foundation
import Nimble
import PromiseKit
import XCTest

@testable import doglist

class DogErrorsTest: XCTestCase {

  func testBadRequest() {
    expect(DogErrors.badRequest.localizedDescription).to(equal("Aconteceu um erro, tente novamente"))
  }

}
