//
//  TableViewPresenter.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import Foundation
protocol TableViewProtocol: class {
  
}


protocol TableViewPresenterProtocol: class {
  init(view: TableViewProtocol)
}

class TableViewPresenter: TableViewPresenterProtocol {
  let view: TableViewProtocol
  required init(view: TableViewProtocol) {
    self.view = view
  }
}
