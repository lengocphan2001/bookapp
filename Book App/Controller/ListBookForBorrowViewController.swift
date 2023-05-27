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
    
    var books = [BorrowBookModel]()
    var bookArray = [BorrowBookModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        books = ModelManager.getInstance().getListBookForBorrow()
        tblListBookBorrow.reloadData()
        self.bookArray = books

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        books = ModelManager.getInstance().getListBookForBorrow()
        tblListBookBorrow.reloadData()
    }
    
}
extension ListBookForBorrowViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblListBookBorrow.dequeueReusableCell(withIdentifier: "BorrowCell") as! BorrowTableViewCell
        cell.imgBookImage.image = UIImage(data: bookArray[indexPath.row].image as! Data)
        cell.txtBookIdentity.text = "Tên sách: \(bookArray[indexPath.row].book_name)"
        cell.txtBookName.text = "Mã sách: \(bookArray[indexPath.row].book_id)"
        cell.txtBookAuthor.text = "Người mượn: \(bookArray[indexPath.row].borrower_name)"
        cell.txtBookCompany.text = "Ngày mượn: \(bookArray[indexPath.row].create_time)"
        cell.btnBorrow.tag = indexPath.row
        cell.btnDetail.tag = indexPath.row
        cell.btnBorrow.addTarget(self, action: #selector(onClickBorrow(_:)), for: .touchUpInside)
        cell.btnDetail.addTarget(self, action: #selector(onClickDetail(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    @objc func onClickBorrow(_ sender: UIButton){
        print(sender.tag)
        
        _ = ModelManager.getInstance().removeBorrow(borrow_book: self.bookArray[sender.tag])
        _ = ModelManager.getInstance().insertToReturnStatis(borrow_book: self.bookArray[sender.tag])
        let isSave = ModelManager.getInstance().returnBook(borrow_book: self.bookArray[sender.tag])
        
        self.bookArray.remove(at: sender.tag)
        self.tblListBookBorrow.reloadData()
        print("Is save: \(isSave)")
    }
    
    @objc func onClickDetail(_ sender: UIButton){
        print(sender.tag)
        let vc = storyboard?.instantiateViewController(withIdentifier: "BorrowDetailViewController") as!
        BorrowDetailViewController
        vc.borrow = bookArray[sender.tag]
        navigationController?.pushViewController(vc, animated: true)
    }

}
