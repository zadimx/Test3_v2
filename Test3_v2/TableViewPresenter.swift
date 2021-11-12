//
//  File.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import Foundation
import UIKit

protocol TableViewProtocol: class {
  func success()
  func failure(error: Error)
}

protocol TableViewPresenterProtocol: class {
  init(view: TableViewProtocol, networkService: NetworkServiceProtocol)
  func getArticles()
  var articles: [Articles]? {get set}
}

class TableViewPresenter: TableViewPresenterProtocol {
  
  var articles: [Articles]?
  weak var view: TableViewProtocol?
  let networkService: NetworkServiceProtocol!
  
  required init(view: TableViewProtocol, networkService: NetworkServiceProtocol) {
    self.view = view
    self.networkService = networkService
    getArticles()
  }
  
  func getArticles() {
    let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=dda979c66ca84f9795d7856f49458efe"
    networkService.getArticles(urlString: urlString){
      [weak self] result in guard let self = self else {return}
      DispatchQueue.main.async {
        switch result{
          case .success(let articles):
            self.articles = articles
            self.view?.success()
          case .failure(let error):
            self.view?.failure(error: error)
        }
      }
      
    }
  }
}
