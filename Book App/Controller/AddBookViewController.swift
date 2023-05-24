//
//  AddBookViewController.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {
    @IBOutlet weak var txtBookNam: UITextField!
    @IBOutlet weak var txtBookAuthor: UITextField!
    @IBOutlet weak var txtBookQuantity: UITextField!
    @IBOutlet weak var txtBookCompany: UITextField!
    @IBOutlet weak var txtBookType: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnAddBookClick(_ sender: Any) {
        let book = BookModel(id: "", name: txtBookNam.text!, author: txtBookAuthor.text!, )
    }
}
