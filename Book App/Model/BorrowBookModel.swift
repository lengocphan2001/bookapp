//
//  BorrowBookModel.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import Foundation
import UIKit
struct BorrowBookModel{
    var id: String
    var book_id: String
    var book_name: String
    var image : Data
    var borrower_name: String
    var borrower_identity: String
    var borrower_phone: String
    var create_time: Date
}
