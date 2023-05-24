//
//  ListBookViewController.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class ListBookViewController: UIViewController {

    @IBOutlet weak var tblListBook: UITableView!
    var books = [BookModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        books = ModelManager.getInstance().getListBook()
        tblListBook.reloadData()
    }
    
}
extension ListBookViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblListBook.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentCell
        cell.txtBookName.text = books[indexPath.row].name
        cell.txtBookAuthor.text = books[indexPath.row].author
        cell.txtBookQuantity.text = books[indexPath.row].quantity
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

