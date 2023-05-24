//
//  ListBookForBorrowViewController.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class ListBookForBorrowViewController: UIViewController {
    
    @IBOutlet weak var tblListBookBorrow: UITableView!
    
    var books = [BookModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        books = ModelManager.getInstance().getListBook()
        tblListBookBorrow.reloadData()
    }
    
}
extension ListBookForBorrowViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblListBookBorrow.dequeueReusableCell(withIdentifier: "BorrowCell") as! BorrowTableViewCell
        cell.imgBookImage.image = UIImage(
            data: books[indexPath.row].image as! Data)
        cell.txtBookIdentity.text = "Mã sách: \(books[indexPath.row].id)"
        cell.txtBookName.text = "Tên sách: \(books[indexPath.row].name)"
        cell.txtBookAuthor.text = "Tác giả: \(books[indexPath.row].author)"
        cell.txtBookQuantity.text = "Số lượng: \(books[indexPath.row].quantity)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
