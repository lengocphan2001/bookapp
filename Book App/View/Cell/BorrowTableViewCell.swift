//
//  BorrowTableViewCell.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class BorrowTableViewCell: UITableViewCell {

    @IBOutlet weak var txtBookName: UILabel!
    
    @IBOutlet weak var imgBookImage: UIImageView!
    @IBOutlet weak var txtBookCompany: UILabel!
    @IBOutlet weak var txtBookAuthor: UILabel!
    @IBOutlet weak var txtBookIdentity: UILabel!
    
    @IBOutlet weak var btnBorrow: UIButton!
    
    @IBOutlet weak var btnDetail: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
}
