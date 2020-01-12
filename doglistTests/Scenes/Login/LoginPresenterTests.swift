//
//  LoginPresenterTests.swift
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

class LoginPresenterTests: XCTestCase {

  var subject: LoginPresenter!

  override func setUp() {
    super.setUp()
    PromiseKit.conf.Q.map = nil
    PromiseKit.conf.Q.return = nil
    subject = LoginPresenter()
  }

  func testInvalidEmailAlert() {
    let viewController = MockLoginDisplayLogic()
    stub(viewController) { stub in
      when(stub.showAlert(message: any())).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentInvalidEmailAlert()

    verify(viewController).showAlert(message: "E-mail inválido, insira um e-mail valido para continuar")
  }

  func testPresentTitle() {
    let viewController = MockLoginDisplayLogic()
    stub(viewController) { stub in
      when(stub.showTitle(text: any())).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentTitle()

    verify(viewController).showTitle(text: "Bem vindo!")
  }

  func testPresentSubtitle() {
    let viewController = MockLoginDisplayLogic()
    stub(viewController) { stub in
      when(stub.showSubtitle(text: any())).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentSubtitle()

    verify(viewController).showSubtitle(text: "Digite o seu e-mail para continuar")
  }

  func testPresentButtonTitle() {
    let viewController = MockLoginDisplayLogic()
    stub(viewController) { stub in
      when(stub.showButtonTitle(text: any())).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentButtonTitle()

    verify(viewController).showButtonTitle(text: "Continuar")
  }

  func testPresentRequestFailureAlert() {
    let viewController = MockLoginDisplayLogic()
    stub(viewController) { stub in
      when(stub.showAlert(message: any())).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentRequestFailureAlert()

    verify(viewController).showAlert(message: "Ocorreu algum erro ao realizar a requisição, tente novamente")
  }

  func testPresentPhotoList() {
    let viewController = MockLoginDisplayLogic()
    stub(viewController) { stub in
      when(stub.showPhotoList()).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentPhotoList()

    verify(viewController).showPhotoList()
  }

}
