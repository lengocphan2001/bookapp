//
//  BookDetailViewController.swift
//  Book App
//
//  Created by nngocphan on 5/25/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var bookName : String = ""
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnBorrowClick: UIButton!
    @IBOutlet weak var imgBookImage: UIImageView!
    @IBOutlet weak var txtBookCompany: UITextField!
    @IBOutlet weak var txtBookQuantity: UITextField!
    @IBOutlet weak var txtBookType: UITextField!
    @IBOutlet weak var txtBookAuthor: UITextField!
    @IBOutlet weak var txtBookName: UITextField!
    @IBOutlet weak var txtBookIdentity: UITextField!
    
    var book : BookModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgBookImage.image = UIImage(data: book?.image as! Data)
        txtBookName.text = book?.name
        txtBookAuthor.text = book?.author
        txtBookCompany.text = book?.company
        txtBookQuantity.text = book?.quantity
        txtBookType.text = book?.type
        txtBookIdentity.text = book?.id
        

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoborrow" {
            let bookborrowVC = segue.destination as! BorrowBookViewController
            bookborrowVC.bookIdentity = (txtBookIdentity?.text)!
            bookborrowVC.bookName = (txtBookName?.text)!
            bookborrowVC.image = imgBookImage.image!.pngData()
        }
    }
    @IBAction func btnBorrowClick(_ sender: Any) {
        performSegue(withIdentifier: "gotoborrow", sender: self)
    }
}

