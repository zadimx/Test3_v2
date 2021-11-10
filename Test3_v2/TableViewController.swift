//
//  TableViewController.swift
//  Test3_v2
//
//  Created by Zinovatny Maksym on 09.11.2021.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate{
  
  
  var objectOtherTableViewCellModel = [
    Other(dateLabel: "1 min ago", historyLabel: "history1", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "2 min ago", historyLabel: "history2", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON2", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "3 min ago", historyLabel: "history3", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON3", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
  ]
  var mainPresenter: TableViewPresenterProtocol!

  @IBOutlet var tableView: UITableView!
  override func viewDidLoad() {
      super.viewDidLoad()
      tableView.register(UINib(nibName: "OtherNewsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TableViewCell")
      tableView.dataSource = self
      tableView.delegate = self;
      view.addSubview(tableView)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension TableViewController: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objectOtherTableViewCellModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? OtherNewsTableViewCell
    let object = objectOtherTableViewCellModel[indexPath.row]
    cell!.set(object: object)
    return cell!
  }
  
  
}

extension TableViewController: TableViewProtocol{
  
}
