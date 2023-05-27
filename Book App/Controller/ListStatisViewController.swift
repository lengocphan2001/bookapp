//
//  ListStatisViewController.swift
//  Book App
//
//  Created by ngocphan on 5/27/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class ListStatisViewController: UIViewController {

    @IBOutlet weak var tblListStatis: UITableView!
    var statis = [StatisticalBook]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        statis = ModelManager.getInstance().getStatis()
        tblListStatis.reloadData()
    }

}
extension ListStatisViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblListStatis.dequeueReusableCell(withIdentifier: "StatisTableViewCell") as! StatisTableViewCell
        cell.imgStatisImage.image = UIImage(data: statis[indexPath.row].image as! Data)
        cell.txtBookIdentity.text = "Mã sách: \(statis[indexPath.row].book_id)"
        cell.txtBookName.text = "Tên sách: \(statis[indexPath.row].book_name)"
        cell.txtIdentity.text = "CMND: \(statis[indexPath.row].identity)"
        cell.txtDate.text = "Ngày mượn: \(statis[indexPath.row].create_time)"
        if statis[indexPath.row].type == "1" {
            cell.txtStatisName.text = "Người trả: \(statis[indexPath.row].name)"
            cell.backgroundColor = UIColor.purple
        }else{
            cell.txtStatisName.text = "Người mượn: \(statis[indexPath.row].name)"
            cell.backgroundColor = UIColor.red
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    
}
