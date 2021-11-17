//
//  CollectionViewTableViewCell.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
  var objectOtherTableViewCellModel = [
    Other(dateLabel: "1 min ago", historyLabel: "history1", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "2 min ago", historyLabel: "history2", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON2", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "3 min ago", historyLabel: "history3", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON3", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
  ]
  let mainPresenter: CollectionViewPresenterProtocol! = nil
  let networkService = NetworkService()
  var searchPerson: [Articles]? = nil
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return objectOtherTableViewCellModel.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
    cell.configuration(with: objectOtherTableViewCellModel[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 300, height: 800)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let data = mainPresenter.articles?[indexPath.row]
    let detailCollectionViewController = ModelBuilder.createDateilCollectionViewModule(data: data)
    
  }
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
    if indexPath.row == objectOtherTableViewCellModel.count-1 && indexPath.row<=10{


      networkService.getArticles(urlString: "https://newsapi.org/v2/top-headlines?country=us&pageSize=1&page=\(objectOtherTableViewCellModel.count-1)&apiKey=0af1fbd249a447148be5eb4a3a6a6368") {[weak self]/*утечка данных*/ (result) in
          switch result {

          case .success(let searchPerson):
              self?.searchPerson = searchPerson
            self?.objectOtherTableViewCellModel.append(Other(dateLabel: searchPerson?[0].publishedAt ?? "", historyLabel: searchPerson?[0].publishedAt ?? "", descriptionNewsTextView: searchPerson?[0].content ?? "", imageNews: searchPerson?[0].urlToImage ?? ""))

            collectionView.reloadData()
            case .failure(let error):
                print("error", error)
          }
      }

    }
  }

  
  @IBOutlet weak var collectionView: UICollectionView!
  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
    print("######awakeFromNib")
    
    collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      return objectOtherTableViewCellModel.count
    }
}
