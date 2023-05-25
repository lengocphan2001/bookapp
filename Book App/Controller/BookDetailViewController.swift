//
//  BookDetailViewController.swift
//  Book App
//
//  Created by nngocphan on 5/25/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnBorrowClick: UIButton!
    @IBOutlet weak var imgBookImage: UIImageView!
    @IBOutlet weak var txtBookCompany: UILabel!
    @IBOutlet weak var txtBookQuantity: UILabel!
    @IBOutlet weak var txtBookType: UILabel!
    @IBOutlet weak var txtBookAuthor: UILabel!
    @IBOutlet weak var txtBookName: UILabel!
    @IBOutlet weak var txtBookIdentity: UILabel!
    
    var book : BookModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgBookImage.image = UIImage(data: book?.image as! Data)
        self.txtBookIdentity.text = "Mã sách: \(String(describing: book?.id ?? nil))"
//        self.txtBookName.text = book?.name
//        self.txtBookAuthor.text = book?.author
//        self.txtBookCompany.text = book?.company
//        self.txtBookQuantity.text = book?.quantity
//        self.txtBookType.text = book?.type
        btnBorrowClick.setTitle(book?.name, for: .normal)
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
    }
    
    @IBAction func btnBorrow(_ sender: Any) {
    }
}

