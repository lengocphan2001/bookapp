//
//  ListReturnViewController.swift
//  Book App
//
//  Created by ngocphan on 5/27/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class ListReturnViewController: UIViewController {
    
    @IBOutlet weak var tblListReturns: UITableView!
    var returns = [BorrowBookModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
         returns = ModelManager.getInstance().getListBookForReturn()
        tblListReturns.reloadData()
    }

}
extension ListReturnViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return returns.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblListReturns.dequeueReusableCell(withIdentifier: "ReturnTableViewCell") as! ReturnTableViewCell
        cell.imgBookImage.image = UIImage(data: returns[indexPath.row].image as! Data)
        cell.txtBookNam.text = "Tên sách: \(returns[indexPath.row].book_name)"
        cell.txtBookId.text = "Mã sách: \(returns[indexPath.row].book_id)"
        cell.txtReturnName.text = "Người trả: \(returns[indexPath.row].borrower_name)"
        cell.txtReturnDate.text = "Ngày trả: \(returns[indexPath.row].create_time)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    
    
}
