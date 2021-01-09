//
//  HomeTableCell.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//

import UIKit
import SDWebImage

class HomeTableCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblUsename: UILabel!
    @IBOutlet weak var lblUserEmail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.customiseCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customiseCell() {
        self.imgAvatar.layer.cornerRadius = self.imgAvatar.frame.height/2
        self.imgAvatar.clipsToBounds = true
    }

    func configureCell(userModel: UserModel)  {
        self.lblUsename.text = userModel.userName
        self.lblUserEmail.text = userModel.email
        self.imgAvatar.sd_setImage(with: URL(string: userModel.imgAvatar), placeholderImage: UIImage(named: "imgAvatar") )
    }

}
