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
    
    @IBOutlet weak var searchBar: UISearchBar!
    var statis = [StatisticalBook]()
    var list = [StatisticalBook]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        statis = ModelManager.getInstance().getStatis()
        list = statis
        tblListStatis.reloadData()

    }

}
extension ListStatisViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblListStatis.dequeueReusableCell(withIdentifier: "StatisTableViewCell") as! StatisTableViewCell
        cell.imgStatisImage.image = UIImage(data: list[indexPath.row].image as! Data)
        cell.txtBookIdentity.text = "Mã sách: \(list[indexPath.row].book_id)"
        cell.txtBookName.text = "Tên sách: \(list[indexPath.row].book_name)"
        cell.txtIdentity.text = "CMND: \(list[indexPath.row].identity)"
        cell.txtDate.text = "Ngày mượn: \(list[indexPath.row].create_time)"
        if list[indexPath.row].type == "1" {
            cell.txtStatisName.text = "Người trả: \(list[indexPath.row].name)"
            cell.backgroundColor = UIColor.purple
        }else{
            cell.txtStatisName.text = "Người mượn: \(list[indexPath.row].name)"
            cell.backgroundColor = UIColor.red
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            list = statis.filter{
                $0.book_name.contains(searchText)
                    ||  $0.book_id.contains(searchText)
                    ||  $0.name.contains(searchText)
                    ||  $0.identity.contains(searchText)
            }
            tblListStatis.reloadData()
        }else {
            list = statis
            tblListStatis.reloadData()
        }
    }
    

    
}
