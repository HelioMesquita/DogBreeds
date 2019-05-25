//
//  DogBreedListInteractor.swift
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

protocol DogBreedsListBusinessLogic {
  var numberOfRows: Int { get }
  func cellForRow(at index: Int) -> String
  func didSelect(at index: Int)
}

protocol DogBreedsListDataStore {
  var session: Login.Session? { get set }
}

class DogBreedsListInteractor: DogBreedsListBusinessLogic, DogBreedsListDataStore {

  var numberOfRows: Int {
    return DogBreedsList.Breeds.allCases.count
  }

  var session: Login.Session?
  var presenter: DogBreedsListPresentationLogic?

  func cellForRow(at index: Int) -> String {
    return DogBreedsList.Breeds.allCases[index].rawValue
  }

  func didSelect(at index: Int) {
    session?.breed = DogBreedsList.Breeds.allCases[index]
    presenter?.presentDogPhotoList()
  }

}
