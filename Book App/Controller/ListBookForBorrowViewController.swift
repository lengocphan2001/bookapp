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
        cell.txtBookIdentity.text = "Tên sách: \(books[indexPath.row].name)"
        cell.txtBookName.text = "Mã sách: \(books[indexPath.row].id)"
        cell.txtBookAuthor.text = "Tác giả: \(books[indexPath.row].author)"
        cell.txtBookCompany.text = "Nhà xuất bản: \(books[indexPath.row].company)"
        cell.btnBorrow.tag = indexPath.row
        cell.btnDetail.tag = indexPath.row
        cell.btnBorrow.addTarget(self, action: #selector(onClickBorrow(_:)), for: .touchUpInside)
        cell.btnDetail.addTarget(self, action: #selector(onClickDetail(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    @objc func onClickBorrow(_ sender: UIButton){
        print(sender.tag)
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddBookViewController") as!
        AddBookViewController
        vc.book = books[sender.tag]
        vc.header = "Cập nhật"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onClickDetail(_ sender: UIButton){
        let alert = UIAlertController(title: "Đồng ý xóa", message: "Bạn có muốn xóa không", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Hủy", style: .cancel, handler: nil)
        
        let deleteAction = UIAlertAction(title: "Xóa", style: .destructive) { _ in
            DispatchQueue.main.async {
                
                self.books.remove(at: sender.tag)
                let isDelete = ModelManager.getInstance().deleteBook(id: self.books[sender.tag].id)
            }
        }
        
        //Add the actions to the alert controller
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        //Present the alert controller
        present(alert, animated: true, completion: nil)
    }
    
    
}
