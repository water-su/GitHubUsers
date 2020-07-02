//
//  ViewController.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/1.
//  Copyright © 2020 water su. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    private let cellId = "simpleCell"

    private let bag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "IconTitleStatusTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        }
    }
    
    private let vm: ListViewModelProtocol = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vm.title
            .subscribe(onNext: { [weak self] (newTitle) in
                self?.title = newTitle
            }).disposed(by: bag)
        
        fetch()
    }

    private func fetch(){
        self.vm.fetchData()
            .subscribe(onNext: { (succeed) in
                if succeed{
                    self.tableView.reloadData()
                }
            }).disposed(by: bag)
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? IconTitleStatusTableViewCell else{
            return UITableViewCell(style: .default, reuseIdentifier: "failCell")
        }
        let item = vm.items[indexPath.row]
        cell.bind(vm: item )
        return cell
    }
}
