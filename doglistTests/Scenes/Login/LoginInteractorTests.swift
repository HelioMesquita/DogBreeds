//
//  LoginInteractorTests.swift
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

class LoginInteractorTests: XCTestCase {

  var subject: LoginInteractor!
  var worker: MockLoginWorker!

  override func setUp() {
    super.setUp()
    PromiseKit.conf.Q.map = nil
    PromiseKit.conf.Q.return = nil
    worker = MockLoginWorker()
    subject = LoginInteractor(worker: worker)
  }

  func testWhenDidSetPresenter() {
    let presenter = MockLoginPresenter()
    stub(presenter) { stub in
      when(stub.presentTitle()).thenDoNothing()
      when(stub.presentSubtitle()).thenDoNothing()
      when(stub.presentButtonTitle()).thenDoNothing()
    }

    subject.presenter = presenter

    verify(presenter).presentTitle()
    verify(presenter).presentSubtitle()
    verify(presenter).presentButtonTitle()
  }

  func testValidateEmailWhenIsInvalid() {
    let presenter = MockLoginPresenter()
    stub(presenter) { stub in
      when(stub.presentTitle()).thenDoNothing()
      when(stub.presentSubtitle()).thenDoNothing()
      when(stub.presentButtonTitle()).thenDoNothing()
      when(stub.presentInvalidEmailAlert()).thenDoNothing()
    }

    subject.presenter = presenter
    subject.validateEmail("aaaa")

    verify(presenter).presentTitle()
    verify(presenter).presentSubtitle()
    verify(presenter).presentButtonTitle()
    verify(presenter).presentInvalidEmailAlert()
  }

  func testValidateEmailWhenIsValidAndSuccessfulRequest() {
    let presenter = MockLoginPresenter()

    stub(worker) { stub in
      when(stub.performLogin(validatedEmail: any())).then { _ -> Promise<Login.Response> in
        return .value(Login.Response(user: Login.User(id: "", email: "", token: "", createdAt: "", updatedAt: "")))
      }
    }

    stub(presenter) { stub in
      when(stub.presentTitle()).thenDoNothing()
      when(stub.presentSubtitle()).thenDoNothing()
      when(stub.presentButtonTitle()).thenDoNothing()
      when(stub.presentPhotoList()).thenDoNothing()
    }

    subject.presenter = presenter
    subject.validateEmail("your@email.com")

    verify(presenter).presentTitle()
    verify(presenter).presentSubtitle()
    verify(presenter).presentButtonTitle()
    verify(presenter).presentPhotoList()
  }

  func testValidateEmailWhenIsValidAndFailureRequest() {
    let presenter = MockLoginPresenter()

    stub(worker) { stub in
      when(stub.performLogin(validatedEmail: any())).then { _ -> Promise<Login.Response> in
        return Promise<Login.Response> { seal in seal.reject(DogErrors.badRequest) }
      }
    }

    stub(presenter) { stub in
      when(stub.presentTitle()).thenDoNothing()
      when(stub.presentSubtitle()).thenDoNothing()
      when(stub.presentButtonTitle()).thenDoNothing()
      when(stub.presentRequestFailureAlert()).thenDoNothing()
    }

    subject.presenter = presenter
    subject.validateEmail("your@email.com")

    verify(presenter).presentTitle()
    verify(presenter).presentSubtitle()
    verify(presenter).presentButtonTitle()
    verify(presenter).presentRequestFailureAlert()
  }

}
