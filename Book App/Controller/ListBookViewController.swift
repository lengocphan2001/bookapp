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
        cell.imgBookImage.image = UIImage(data: books[indexPath.row].image as! Data)
        cell.txtBookName.text = "Tên sách: \(books[indexPath.row].name)"
        cell.txtBookAuthor.text = "Tác giả: \(books[indexPath.row].author)"
        cell.txtBookQuantity.text = "Số lượng: \(books[indexPath.row].quantity)"
        cell.btnEdit.tag = indexPath.row
        cell.btnDelete.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(onClickEdit(_:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(onClickDelete(_:)), for: .touchUpInside)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    @objc func onClickEdit(_ sender: UIButton){
        print(sender.tag)
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddBookViewController") as!
        AddBookViewController
        vc.book = books[sender.tag]
        vc.header = "Cập nhật"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func onClickDelete(_ sender: UIButton){
        let alert = UIAlertController(title: "Đồng ý xóa", message: "Bạn có muốn xóa không", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Hủy", style: .cancel, handler: nil)
        
        let deleteAction = UIAlertAction(title: "Xóa", style: .destructive) { _ in
            DispatchQueue.main.async {
                
                self.books.remove(at: sender.tag)
                let isDelete = ModelManager.getInstance().deleteBook(id: self.books[sender.tag].id)
                self.tblListBook.reloadData()
            }
        }
        
        //Add the actions to the alert controller
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        //Present the alert controller
        present(alert, animated: true, completion: nil)
    }
    
}

