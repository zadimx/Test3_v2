//
//  DetailCollectionViewPresenter.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import Foundation
import UIKit

protocol DetailCollectionViewProtocol: class {
  func setData(data: Articles?)
}

protocol DetailCollectionViewPresenterProtocol: class {
  init(view: DetailCollectionViewProtocol, networkService: NetworkServiceProtocol, data: Articles?)
  func setData()
}

class DetailCollectionViewPresenter: DetailCollectionViewPresenterProtocol {
  weak var view: DetailCollectionViewProtocol?
  let networkService: NetworkServiceProtocol!
  let data: Articles?
  
  required init(view: DetailCollectionViewProtocol, networkService: NetworkServiceProtocol, data: Articles?) {
    self.view = view
    self.networkService = networkService
    self.data = data
  }
  
  func setData() {
    self.view?.setData(data: data)
  }
}
