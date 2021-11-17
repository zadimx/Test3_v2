//
//  MyCollectionViewCell.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 01.11.2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

  @IBOutlet var myLabel: UILabel!
  @IBOutlet var myLabelHistory: UILabel!
  @IBOutlet var myTextView: UITextView!
  @IBOutlet var myImageView: UIImageView!
  static let identifier = "MyCollectionViewCell"
  static func nib() -> UINib {
    return UINib(nibName: "MyCollectionViewCell", bundle: nil)
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
