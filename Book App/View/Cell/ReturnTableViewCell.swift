//
//  ReturnTableViewCell.swift
//  Book App
//
//  Created by ngocphan on 5/27/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class ReturnTableViewCell: UITableViewCell {

    @IBOutlet weak var imgBookImage: UIImageView!
    @IBOutlet weak var txtReturnDate: UILabel!
    @IBOutlet weak var txtReturnName: UILabel!
    @IBOutlet weak var txtBookNam: UILabel!
    @IBOutlet weak var txtBookId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
