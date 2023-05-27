//
//  BorrowBookViewController.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class BorrowBookViewController: UIViewController {

    @IBOutlet weak var txtBorrowerPhone: UITextField!
    @IBOutlet weak var txtBorrowerName: UITextField!
    @IBOutlet weak var txtBorrowerIdentity: UITextField!
    @IBOutlet weak var txtBookName: UITextField!
    @IBOutlet weak var txtBookIdentity: UITextField!
    
    var bookIdentity : String = ""
    var bookName : String = ""
    var image : Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtBookIdentity.text = bookIdentity
        txtBookName.text = bookName
    }
    
    
    @IBAction func btnBorrowClick(_ sender: Any) {
        let book = BorrowBookModel(id: "", book_id: txtBookIdentity.text!, book_name: txtBookName.text!, image: image!, borrower_name: txtBorrowerName.text!, borrower_identity: txtBorrowerIdentity.text!, borrower_phone: txtBorrowerPhone.text!,create_time: Date())
        
        let isSave = ModelManager.getInstance().saveBookBorrow(borrow_book: book)
        
        let isUpdateBook = ModelManager.getInstance().updateBookWhenBorrow(id: txtBookIdentity.text!)
        print("Is save: \(isSave)")
    }
    

}
