//
//  DogBreedListInteractorTests.swift
//  doglistTests
//
//  Created by Hélio Mesquita on 25/05/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import Cuckoo
import Foundation
import Nimble
import XCTest

@testable import doglist

class DogBreedListInteractorTests: XCTestCase {

  var subject: DogBreedsListInteractor!
  var session: Login.Session = Login.Session(token: "token")

  override func setUp() {
    super.setUp()
    subject = DogBreedsListInteractor()
    subject.session = session
  }

  func testNumberOfRownWhenIsNil() {
    expect(self.subject.numberOfRows).to(equal(4))
  }

  func testCellForRowWhen() {
    expect(self.subject.cellForRow(at: 0)).to(equal("husky"))
  }

  func testDidSelectRow() {
    let presenter = MockDogBreedsListPresenter()
    stub(presenter) { stub in
      when(stub.presentDogPhotoList()).thenDoNothing()
    }

    subject.presenter = presenter
    subject.didSelect(at: 2)

    expect(self.subject.session?.breed).to(equal(.pug))
    verify(presenter).presentDogPhotoList()
  }

}
