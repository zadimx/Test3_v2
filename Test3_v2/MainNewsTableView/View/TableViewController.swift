//
//  TableViewController.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import UIKit

class TableViewController: UIViewController{
  
  
  let networkService = NetworkService()
  var searchPerson: [Articles]? = nil
  

  var objectOtherTableViewCellModel = [
    Other(dateLabel: "1 min ago", historyLabel: "history1", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "2 min ago", historyLabel: "history2", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON2", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "3 min ago", historyLabel: "history3", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON3", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
  ]
  var mainPresenter: TableViewPresenterProtocol!

  @IBOutlet weak var tableView: UITableView!{
    didSet{
      tableView.register(UINib(nibName: "OtherNewsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TableViewCell")
      tableView.register(UINib(nibName: "CollectionViewTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "CollectionView")
    }
  }
  override func viewDidLoad() {
      super.viewDidLoad()

      tableView.dataSource = self
      tableView.delegate = self;
      view.addSubview(tableView)
    }
  
}
extension TableViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objectOtherTableViewCellModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("######tableView \(indexPath.section)")
    if indexPath.row == 0 {
      let cell1 = tableView.dequeueReusableCell(withIdentifier: "CollectionView", for: indexPath) as? CollectionViewTableViewCell
      return cell1!
    }else{
      let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? OtherNewsTableViewCell
//      let object = objectOtherTableViewCellModel[indexPath.row]
//      let object1 = mainPresenter.articles?[indexPath.row]
//      let object = Other(dateLabel: object1?.publishedAt ?? "", historyLabel: object1?.url ?? "", descriptionNewsTextView: object1?.content ?? "", imageNews: object1?.urlToImage ?? "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
      cell!.set(object: objectOtherTableViewCellModel[indexPath.row])

      return cell!
    }
  }
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
    if indexPath.row == objectOtherTableViewCellModel.count-1 && indexPath.row<=20{
      print("$$$$$willDisplay \(indexPath.row)")
      
  //      let object = objectOtherTableViewCellModel[indexPath.row]
      var object: Other?
      networkService.getArticles(urlString: "https://newsapi.org/v2/top-headlines?country=us&pageSize=1&page=\(objectOtherTableViewCellModel.count-1)&apiKey=0af1fbd249a447148be5eb4a3a6a6368") {[weak self]/*утечка данных*/ (result) in
          switch result {

          case .success(let searchPerson):
              self?.searchPerson = searchPerson
            object = Other(dateLabel: searchPerson?[0].publishedAt ?? "", historyLabel: searchPerson?[0].url ?? "", descriptionNewsTextView: searchPerson?[0].content ?? "", imageNews: searchPerson?[0].urlToImage ?? "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
            self?.objectOtherTableViewCellModel.append(object ?? Other(dateLabel: "3 min ago", historyLabel: "history3", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON3", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"))

            tableView.reloadData()
            case .failure(let error):
                print("error", error)
          }
      }
  }
  
}
}
extension TableViewController: UITableViewDelegate{
  
  }
extension TableViewController: TableViewProtocol{
  func success() {
    tableView.reloadData()
  }
  
  func failure(error: Error) {
    print("OSHIBKA \(error)")
  }
  
  
}
