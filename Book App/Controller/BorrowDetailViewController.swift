//
//  BorrowDetailViewController.swift
//  Book App
//
//  Created by ngocphan on 5/27/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class BorrowDetailViewController: UIViewController {

    @IBOutlet weak var txtBookId: UITextField!
    @IBOutlet weak var btnPay: UIButton!
    @IBOutlet weak var imgBookImage: UIImageView!
    @IBOutlet weak var txtBorrowDate: UITextField!
    @IBOutlet weak var txtBorrowerPhone: UITextField!
    @IBOutlet weak var txtBorrowerIdentity: UITextField!
    @IBOutlet weak var txtBorrowerName: UITextField!
    @IBOutlet weak var txtBookName: UITextField!
    
    var borrow : BorrowBookModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgBookImage.image = UIImage(data: borrow?.image as! Data)
        txtBookId.text = borrow?.book_id
        txtBookName.text = borrow?.book_name
        txtBorrowerName.text = borrow?.borrower_name
        txtBorrowerIdentity.text = borrow?.borrower_identity
        txtBorrowerPhone.text = borrow?.borrower_phone
        let dateFormatter = DateFormatter()
        txtBorrowDate.text = dateFormatter.string(from: (borrow?.create_time)!)
    }
    
    
    @IBAction func btnReturnClick(_ sender: Any) {
        print("Borrow: \(borrow!.id)")
        _ = ModelManager.getInstance().removeBorrow(borrow_book: borrow!)
        _ = ModelManager.getInstance().insertToReturnStatis(borrow_book: borrow!)
        let isSave = ModelManager.getInstance().returnBook(borrow_book: borrow!)
        _ = ModelManager.getInstance().updateBookWhenReturn(id: borrow!.book_id)
        
        print("Is save: \(isSave)")
    }
}
