//
//  ModelManager.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import Foundation

import UIKit

// global instace
var shareInstace = ModelManager()
class ModelManager{
    var database: FMDatabase? = nil
    
    static func getInstance()-> ModelManager{
        if shareInstace.database == nil{
            shareInstace.database = FMDatabase(path: Util.getPath(fileName: "Book.db"))
        }
        
        return shareInstace
    }
    
    func saveBook(book: BookModel) -> Bool{
        shareInstace.database?.open()
        
        let isSave = shareInstace.database?.executeUpdate("insert into book(name,author,company,type,quantity,image) values(?, ?, ?, ?, ?, ?)"
            , withArgumentsIn: [book.name, book.author, book.company, book.type, book.quantity, book.image])
        shareInstace.database?.close()
        return isSave!
    }
}
