//
//  DogPhotoListPresenterTests.swift
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

class DogPhotoListPresenterTests: XCTestCase {

  var subject: DogPhotoListPresenter!

  override func setUp() {
    super.setUp()
    PromiseKit.conf.Q.map = nil
    PromiseKit.conf.Q.return = nil
    subject = DogPhotoListPresenter()
  }

  func testPresentTitleWhenIsNil() {
    let viewController = MockDogPhotoListDisplayLogic()
    stub(viewController) { stub in
      when(stub.showTitle(any())).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentTitle(nil)

    verify(viewController).showTitle("Breed ")
  }

  func testPresentTitleWhen() {
    let viewController = MockDogPhotoListDisplayLogic()
    stub(viewController) { stub in
      when(stub.showTitle(any())).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentTitle("husky")

    verify(viewController).showTitle("Breed husky")
  }

  func testReloadCollection() {
    let viewController = MockDogPhotoListDisplayLogic()
    stub(viewController) { stub in
      when(stub.reloadCollection()).thenDoNothing()
    }

    subject.viewController = viewController
    subject.reloadCollection()

    verify(viewController).reloadCollection()
  }

  func testPresentRequestError() {
    let viewController = MockDogPhotoListDisplayLogic()
    stub(viewController) { stub in
      when(stub.showAlert(message: any())).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentRequestFailureAlert()

    verify(viewController).showAlert(message: "Ocorreu algum erro ao realizar a requisição, tente novamente")
  }

}
