//
//  ModelManager.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import Foundation

import UIKit

// global instance
var shareInstace = ModelManager()

class ModelManager{
    var database: FMDatabase? = nil
    
    static func getInstance()-> ModelManager{
        if shareInstace.database == nil{
            shareInstace.database = FMDatabase(path: Util.share.getPath(fileName: "BookApp.db"))
        }
        
        return shareInstace
    }
    
    func saveBook(book: BookModel) -> Bool{
        shareInstace.database?.open()
        
        let isSave = shareInstace.database?.executeUpdate("insert into books (name,author,company,type,quantity,image) values(?, ?, ?, ?, ?, ?)"
            , withArgumentsIn: [book.name, book.author, book.company, book.type, book.quantity, book.image])
        
        shareInstace.database?.close()
        return isSave!
    }
    
    func getListBook()->[BookModel]{
        shareInstace.database?.open()
        var books = [BookModel]()
        do{
            let resultset : FMResultSet? = try shareInstace.database?.executeQuery("select * from books", values: nil)
            
            
            if resultset != nil {
                while resultset!.next(){
                    let book = BookModel(id: (resultset!.string(forColumn: "id")!), name: (resultset!.string(forColumn: "name") ?? ""), author: (resultset!.string(forColumn: "author") ?? ""), company: (resultset!.string(forColumn: "company") ?? ""), type: (resultset!.string(forColumn: "type") ??
                        ""), quantity: (resultset!.string(forColumn: "quantity") ?? ""), image: (resultset!.string(forColumn: "image") ?? ""))
                    books.append(book)
                }
            }
            
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstace.database?.close()
        
        return books
    }
}
