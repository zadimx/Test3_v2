//
//  MainBuilder.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import Foundation
import UIKit

protocol MainBuilder {
  static func createMainModule() -> UIViewController
  static func createDateilCollectionViewModule(data: Articles?) -> UIViewController
}

class ModelBuilder: MainBuilder {
  
  static func createDateilCollectionViewModule(data: Articles?) -> UIViewController {
    let view = DetailCollectionView()
    let networkService = NetworkService()
    
    let presenter = DetailCollectionViewPresenter(view: view, networkService: networkService, data: data)
    view.presenter = presenter
    return view
  }
  
  static func createMainModule() -> UIViewController {
    let view = TableViewController()
    let networkService = NetworkService()
    
    let mainPresenter = TableViewPresenter(view: view, networkService: networkService)
    view.mainPresenter = mainPresenter
    return view
  }

}
