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
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "GitHub Users"
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        cell.textLabel?.text = "cell"
        return cell
    }
    
    
}
