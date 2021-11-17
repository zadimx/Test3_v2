//
//  CollectionViewPresenter.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 16.11.2021.
//

import Foundation
import UIKit

protocol CollectionViewProtocol: class {
  func success()
  func failure(error: Error)
}

protocol CollectionViewPresenterProtocol: class {
  init(view: CollectionViewProtocol, networkService: NetworkServiceProtocol)
  func getArticles()
  var articles: [Articles]? {get set}
}

class CollectionViewPresenter: CollectionViewPresenterProtocol {
  
  var articles: [Articles]?
  weak var view: CollectionViewProtocol?
  let networkService: NetworkServiceProtocol!
  
  required init(view: CollectionViewProtocol, networkService: NetworkServiceProtocol) {
    self.view = view
    self.networkService = networkService
    getArticles()
  }
  
  func getArticles() {
    let urlString = "https://newsapi.org/v2/top-headlines?country=us&pageSize=10&apiKey=0af1fbd249a447148be5eb4a3a6a6368"
    self.networkService.getArticles(urlString: urlString){
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

