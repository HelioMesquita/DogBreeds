//
//  DogPhotoListInteractorTests.swift
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

class DogPhotoListInteractorTests: XCTestCase {

  var subject: DogPhotoListInteractor!
  var worker: MockDogPhotoListWorker!
  var response: DogPhotoList.Response = DogPhotoList.Response(category: "", list: ["value1", "value2"])
  var session: Login.Session = Login.Session(token: "token")

  override func setUp() {
    super.setUp()
    PromiseKit.conf.Q.map = nil
    PromiseKit.conf.Q.return = nil
    worker = MockDogPhotoListWorker()
    subject = DogPhotoListInteractor(worker: worker)
  }

  func testNumberOfRowsWhenIsNil() {
    expect(self.subject.numberOfRows).to(equal(0))
  }

  func testNumberOfRowsWhenHasResponse() {
    subject.response = response
    expect(self.subject.numberOfRows).to(equal(2))
  }

  func testCellForRowWhenIsNil() {
    expect(self.subject.cellForRow(at: 0)).to(equal(""))
  }

  func testCellForRowWhenHasResponse() {
    subject.response = response
    expect(self.subject.cellForRow(at: 0)).to(equal("value1"))
  }

  func testLoadWithoutSession() {
    let presenter = MockDogPhotoListPresenter()
    stub(presenter) { stub in
      when(stub.presentTitle(any())).thenDoNothing()
    }

    subject.presenter = presenter
    subject.load()

    verify(presenter).presentTitle(any())
  }

  func testLoadSuccessfulRequest() {
    let presenter = MockDogPhotoListPresenter()
    stub(presenter) { stub in
      when(stub.presentTitle(any())).thenDoNothing()
      when(stub.reloadCollection()).thenDoNothing()
    }

    stub(worker) { stub in
      when(stub.getPhotoList(session: any())).then { _ -> Promise<DogPhotoList.Response> in
        return .value(self.response)
      }
    }

    subject.presenter = presenter
    subject.session = session
    subject.load()

    verify(presenter).presentTitle(any())
    verify(presenter).reloadCollection()
  }

  func testLoadFailureRequest() {
    let presenter = MockDogPhotoListPresenter()
    stub(presenter) { stub in
      when(stub.presentTitle(any())).thenDoNothing()
      when(stub.presentRequestFailureAlert()).thenDoNothing()
    }

    stub(worker) { stub in
      when(stub.getPhotoList(session: any())).then { _ -> Promise<DogPhotoList.Response> in
        return Promise<DogPhotoList.Response> { seal in seal.reject(DogErrors.badRequest) }
      }
    }

    subject.presenter = presenter
    subject.session = session
    subject.load()

    verify(presenter).presentTitle(any())
    verify(presenter).presentRequestFailureAlert()
  }

}
