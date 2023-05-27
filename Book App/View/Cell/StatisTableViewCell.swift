//
//  StatisTableViewCell.swift
//  Book App
//
//  Created by ngocphan on 5/27/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class StatisTableViewCell: UITableViewCell {

    @IBOutlet weak var txtIdentity: UILabel!
    @IBOutlet weak var txtDate: UILabel!
    @IBOutlet weak var txtBookIdentity: UILabel!
    @IBOutlet weak var txtBookName: UILabel!
    @IBOutlet weak var txtStatisName: UILabel!
    @IBOutlet weak var imgStatisImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
