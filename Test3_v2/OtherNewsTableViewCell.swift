//
//  Table.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 10.11.2021.
//

import Foundation
import UIKit
class OtherNewsTableViewCell: UITableViewCell{

  @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var mainNewsTextView: UITextView!
  @IBOutlet weak var imageNews: UIImageView!
  
  override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
    initialImageView(imageView: imageNews)
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
  func set(object: Other){
      self.dateLabel.text = object.dateLabel
      self.imageNews.image = UIImage(data: (try? Data(contentsOf: URL(string: object.imageNews)!))!)
      self.urlLabel.text = object.historyLabel
      self.mainNewsTextView.text = object.descriptionNewsTextView
  }
}
extension OtherNewsTableViewCell {
  func initialImageView(imageView: UIImageView){
    imageView.layer.cornerRadius = 20
  }
}
