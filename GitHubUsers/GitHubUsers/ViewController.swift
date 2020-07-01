//
//  ViewController.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/1.
//  Copyright © 2020 water su. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let cellId = "simpleCell"
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "IconTitleStatusTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "GitHub Users"
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? IconTitleStatusTableViewCell else{
            return UITableViewCell(style: .default, reuseIdentifier: "failCell")
        }
        cell.bind(vm: UserDummyData( indexPath.row % 2 == 0 ))
        return cell
    }
    
}
