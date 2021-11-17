//
//  DetailCollectionView.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 17.11.2021.
//

import UIKit

class DetailCollectionView: UIViewController {

  var presenter: DetailCollectionViewPresenterProtocol!
  var detailsObject = Other(dateLabel: "", historyLabel: "", descriptionNewsTextView: "", imageNews: "")
  @IBOutlet weak var newsDetailsDateLabel: UILabel!
  @IBOutlet weak var newsDetailsHistoryLabel: UILabel!
  @IBOutlet weak var newsDetailsTopicTextView: UITextView!
  @IBOutlet weak var newsDetailsDesriptionTextView: UITextView!
  @IBOutlet weak var newsDetailsImageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.setData()
    
    // Do any additional setup after loading the view.
  }
}
extension DetailCollectionView: DetailCollectionViewProtocol{
  func setData(data: Articles?) {
    newsDetailsImageView.image = UIImage(data: (try? Data(contentsOf: URL(string: data!.urlToImage!)!))!)
    newsDetailsDateLabel.text = data?.publishedAt
    newsDetailsHistoryLabel.text = data?.url
    newsDetailsTopicTextView.text = data?.title
    newsDetailsDesriptionTextView.text = data?.content
  }
  
  
}
