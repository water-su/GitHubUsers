//
//  IconTitleStatusTableViewCell.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/1.
//  Copyright © 2020 water su. All rights reserved.
//

import UIKit
import SDWebImage

struct UserDummyData: IconTitleStatusViewModelProtocol {

    var icon: String? = "https://www.gravatar.com/avatar/80ae0181e9a1b4cca4cc34b0f1c0aee9?s=64&d=identicon&r=PG&f=1"
    
    var title: String? = "Dummy User"
    
    var status: (label: String, color: UIColor)?
    
    init(_ isAdmin: Bool) {
        if isAdmin{
            status = ("staff", .blue)
        }else{
            status = nil
        }
    }
}

class IconTitleStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!{
        didSet{
            iconView.layer.cornerRadius = iconView.frame.height/2
            iconView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var container: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var statusView: UIView!{
        didSet{
            statusView.layer.cornerRadius = statusView.frame.height/2
            statusView.clipsToBounds = true
        }
    }
    @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(vm: IconTitleStatusViewModelProtocol){
        
        self.titleLabel.text = vm.title
        
        if let icon = vm.icon, let url = URL(string: icon){
            self.iconView.sd_setImage(with: url, completed: nil)
        }   // TODO: to add image placeholder for user without avatar (no url or no image)

        if let status = vm.status{
            self.container.addArrangedSubview( self.statusView )
            self.statusLabel.text = status.label.uppercased()
            self.statusView.backgroundColor = status.color
        }else{
            self.statusView.removeFromSuperview()
        }
    }
    
}
