//
//  DogBreedListPresenterTests.swift
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

class DogBreedListPresenterTests: XCTestCase {

  var subject: DogBreedsListPresenter!

  override func setUp() {
    super.setUp()
    subject = DogBreedsListPresenter()
  }

  func testDidSelectRow() {
    let viewController = MockDogBreedsListDisplayLogic()
    stub(viewController) { stub in
      when(stub.showDogPhotoList()).thenDoNothing()
    }

    subject.viewController = viewController
    subject.presentDogPhotoList()

    verify(viewController).showDogPhotoList()
  }

}

