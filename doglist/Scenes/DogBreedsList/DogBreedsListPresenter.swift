//
//  DogBreedsListPresenter.swift
//  doglist
//
//  Created by Hélio Mesquita on 25/05/19.
//  Copyright (c) 2019 Hélio Mesquita. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DogBreedsListPresentationLogic {
  func presentDogPhotoList()
}

class DogBreedsListPresenter: DogBreedsListPresentationLogic {

  weak var viewController: DogBreedsListDisplayLogic?

  func presentDogPhotoList() {
    viewController?.showDogPhotoList()
  }
  
}
