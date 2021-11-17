//
//  CollectionViewCell.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 16.11.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

  @IBOutlet var myLabel: UILabel!
  @IBOutlet var myLabelHistory: UILabel!
  @IBOutlet var myTextView: UITextView!
  @IBOutlet var myImageView: UIImageView!
  static let identifier = "CollectionViewCell"
  static func nib() -> UINib {
    return UINib(nibName: "CollectionViewCell", bundle: nil)
  }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  public func configuration(with mainObject: Other){
    myLabel.text = mainObject.dateLabel
    myLabelHistory.text = mainObject.historyLabel
    myTextView.text = mainObject.descriptionNewsTextView
    myImageView.image = UIImage(data: (try? Data(contentsOf: URL(string: mainObject.imageNews)!))!)
  }
  
//  func set() -> Other{
//    return Other(dateLabel: myLabel.text ?? <#default value#>, historyLabel: myLabelHistory.text, descriptionNewsTextView: myTextView.text, imageNews: myImageView.image)
//  }
}

