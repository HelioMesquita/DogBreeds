//
//  LoginProviderTests.swift
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

class LoginProviderTests: XCTestCase {

  var subject: LoginProvider!

  override func setUp() {
    super.setUp()
    subject = LoginProvider(emailEncodable: Login.BodyRequest(email: "email"))
  }

  func testPath() {
    expect(self.subject.path).to(equal("/signup"))
  }

  func testHttpVerb() {
    expect(self.subject.httpVerb).to(equal(.POST))
  }

  func testBodyParameters() {
    expect(self.subject.bodyParameters).toNot(beNil())
  }

  func testHeader() {
    expect(self.subject.headers["Content-Type"]).to(equal("application/json"))
  }

  func testQueryParameters() {
    expect(self.subject.queryParameters).to(beNil())
  }

  func testScheme() {
    expect(self.subject.scheme).to(equal("https"))
  }

  func testHost() {
    expect(self.subject.host).to(equal("api-iddog.idwall.co"))
  }

}
