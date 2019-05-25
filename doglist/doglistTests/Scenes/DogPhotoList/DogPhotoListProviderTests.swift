//
//  DogPhotoListProviderTests.swift
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

class DogPhotoListProviderTests: XCTestCase {

  var subject: DogPhotoListProvider!

  override func setUp() {
    super.setUp()
    subject = DogPhotoListProvider(session: Login.Session(token: "token"))
  }

  func testPath() {
    expect(self.subject.path).to(equal("/feed"))
  }

  func testHttpVerb() {
    expect(self.subject.httpVerb).to(equal(.GET))
  }

  func testBodyParameters() {
    expect(self.subject.bodyParameters).to(beNil())
  }

  func testHeader() {
    expect(self.subject.headers["Content-Type"]).to(equal("application/json"))
    expect(self.subject.headers["Authorization"]).to(equal("token"))
  }

  func testQueryParameters() {
    let queryItem = subject.queryParameters?.first
    expect(queryItem?.name).to(equal("category"))
    expect(queryItem?.value).to(equal("husky"))
  }

  func testScheme() {
    expect(self.subject.scheme).to(equal("https"))
  }

  func testHost() {
    expect(self.subject.host).to(equal("api-iddog.idwall.co"))
  }

  func testURLRequest() {
    let urlRequest = subject.asURLRequest
    expect(urlRequest.allHTTPHeaderFields?.count).to(equal(2))
    expect(urlRequest.httpBody).to(beNil())
    expect(urlRequest.url?.absoluteString).to(equal("https://api-iddog.idwall.co/feed?category=husky"))
  }

}
