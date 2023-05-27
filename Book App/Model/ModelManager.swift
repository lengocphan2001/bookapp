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
        	
        let isSave = shareInstace.database?.executeUpdate("insert into books (name,author,company,type,quantity,image,create_time) values(?, ?, ?, ?, ?, ?, ?)"
            , withArgumentsIn: [book.name, book.author	, book.company, book.type, book.quantity, book.image, book.create_time])
        
        shareInstace.database?.close()
        return isSave!
    }
    
    func updateBook(book: BookModel) -> Bool{
        shareInstace.database?.open()
        
        let isUpdate = shareInstace.database?.executeUpdate("update books set name = ?, author = ?, company = ?, type = ?, quantity = ?, image = ? where id = ?", withArgumentsIn: [book.name, book.author, book.company, book.type, book.quantity, book.image, book.id])
        shareInstace.database?.close()
        
        return isUpdate!
    }
    
    func deleteBook(id: String) -> Bool{
        shareInstace.database?.open()
        
        let isDelete = shareInstace.database?.executeUpdate("delete from books where id = ?", withArgumentsIn: [id])
        shareInstace.database?.close()
        
        return isDelete!
    }
    
    func getListBook()->[BookModel]{
        shareInstace.database?.open()
        var books = [BookModel]()
        do{
            let resultset : FMResultSet? = try shareInstace.database?.executeQuery("select * from books where quantity > 0", values: nil)
            
            
            if resultset != nil {
                while resultset!.next(){
                    let book = BookModel(id: (resultset!.string(forColumn: "id")!), name: (resultset!.string(forColumn: "name") ?? ""), author: (resultset!.string(forColumn: "author") ?? ""), company: (resultset!.string(forColumn: "company") ?? ""), type: (resultset!.string(forColumn: "type") ??
                        ""), quantity: (resultset!.string(forColumn: "quantity") ?? ""), image: ((resultset!.data(forColumn: "image") ?? nil)!), create_time: ((resultset?.date(forColumn: "create_time"))!))
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
    
    func getListBookForBorrow() -> [BorrowBookModel]{
        var books = [BorrowBookModel]()
        shareInstace.database?.open()
        do{
            let resultset : FMResultSet? = try shareInstace.database?.executeQuery("select * from borrow_books", values: nil)
            
            
            if resultset != nil {
                while resultset!.next(){
                    let book = BorrowBookModel(id: (resultset!.string(forColumn: "id") ?? ""), book_id: (resultset!.string(forColumn: "book_id") ?? ""), book_name: (resultset!.string(forColumn: "book_name") ?? ""), image: (((resultset!.data(forColumn: "image") ?? nil)!)), borrower_name: (resultset!.string(forColumn: "borrower_name") ??
                        ""), borrower_identity: (resultset!.string(forColumn: "borrower_identity") ?? ""), borrower_phone: (resultset!.string(forColumn: "borrower_phone") ?? ""), create_time: ((resultset?.date(forColumn: "create_time"))!))
                    books.append(book)
                    print("Borrow id: \(book.id)")
                }
            }
            
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstace.database?.close()
        return books
    }
    func getListBookForReturn() -> [BorrowBookModel]{
        var books = [BorrowBookModel]()
        shareInstace.database?.open()
        do{
            let resultset : FMResultSet? = try shareInstace.database?.executeQuery("select * from return_books", values: nil)
            
            
            if resultset != nil {
                while resultset!.next(){
                    let book = BorrowBookModel(id: (resultset!.string(forColumn: "id") ?? ""), book_id: (resultset!.string(forColumn: "book_id") ?? ""), book_name: (resultset!.string(forColumn: "book_name") ?? ""), image: (((resultset!.data(forColumn: "image") ?? nil)!)), borrower_name: (resultset!.string(forColumn: "borrower_name") ??
                        ""), borrower_identity: (resultset!.string(forColumn: "borrower_identity") ?? ""), borrower_phone: (resultset!.string(forColumn: "borrower_phone") ?? ""), create_time: ((resultset?.date(forColumn: "create_time"))!))
                    books.append(book)
                    print("Borrow id: \(book.id)")
                }
            }
            
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstace.database?.close()
        return books
    }
    func getStatis() -> [StatisticalBook]{
        var statis = [StatisticalBook]()
        shareInstace.database?.open()
        do{
            let resultset : FMResultSet? = try shareInstace.database?.executeQuery("select * from statis", values: nil)
            
            
            if resultset != nil {
                while resultset!.next(){
                    let statiscal = StatisticalBook(id: (resultset!.string(forColumn: "id") ?? ""), book_id: (resultset!.string(forColumn: "book_id") ?? ""), book_name: (resultset!.string(forColumn: "book_name") ?? ""), name: (resultset!.string(forColumn: "name") ?? ""), identity: (resultset!.string(forColumn: "identity") ?? ""), phone: (resultset!.string(forColumn: "phone") ?? ""),image: (((resultset!.data(forColumn: "image") ?? nil)!)), create_time: ((resultset?.date(forColumn: "create_time"))!), type: (resultset!.string(forColumn: "type") ?? ""))
                    statis.append(statiscal)
                }
            }
            
        }
        catch let err{
            print(err.localizedDescription)
        }
        shareInstace.database?.close()
        return statis
    }
    
    func saveBookBorrow(borrow_book: BorrowBookModel) -> Bool{
        shareInstace.database?.open()
        
        let isSave = shareInstace.database?.executeUpdate("insert into borrow_books (book_id,book_name,image,borrower_name,borrower_identity,borrower_phone,create_time) values(?, ?, ?, ?, ?, ?, ?)"
            , withArgumentsIn: [borrow_book.book_id, borrow_book.book_name,borrow_book.image, borrow_book.borrower_name, borrow_book.borrower_identity, borrow_book.borrower_phone, borrow_book.create_time])
        
        let save = shareInstace.database?.executeUpdate("insert into statis (book_id,book_name,name,identity,phone,image,create_time,type) values(?, ?, ?, ?, ?, ?, ?, ?)"
            , withArgumentsIn: [borrow_book.book_id, borrow_book.book_name,borrow_book.borrower_name, borrow_book.borrower_identity, borrow_book.borrower_phone,borrow_book.image, borrow_book.create_time,0])
        
        shareInstace.database?.close()
        return isSave! && save!
    }
    
    func updateBookWhenBorrow(id : String) -> Bool{
        shareInstace.database?.open()
        
        let isSave = shareInstace.database?.executeUpdate("update books set quantity = quantity - 1 where id = ?"
            , withArgumentsIn: [id])
        
        shareInstace.database?.close()
        return isSave!
    }
    
    func updateBookWhenReturn(id : String) -> Bool{
        shareInstace.database?.open()
        
        let isSave = shareInstace.database?.executeUpdate("update books set quantity = quantity + 1 where id = ?"
            , withArgumentsIn: [id])
        
        shareInstace.database?.close()
        return isSave!
    }
    
    func removeBorrow(borrow_book : BorrowBookModel) -> Bool{
        shareInstace.database?.open()
        let isDelete = shareInstace.database?.executeUpdate("delete from borrow_books where id = ?", withArgumentsIn: [borrow_book.id])
        shareInstace.database?.close()
        
        return isDelete!
    }
    
    func insertToBorrowStatis(borrow_book: BorrowBookModel) -> Bool{
        shareInstace.database?.open()
        
        let save = shareInstace.database?.executeUpdate("insert into statis (book_id,book_name,name,identity,phone,image,create_time,type) values(?, ?, ?, ?, ?, ?, ?, ?)"
            , withArgumentsIn: [borrow_book.book_id, borrow_book.book_name,borrow_book.borrower_name, borrow_book.borrower_identity, borrow_book.borrower_phone,borrow_book.image, borrow_book.create_time,9])
        shareInstace.database?.close()
        
        return save!
    }
    
    func insertToReturnStatis(borrow_book: BorrowBookModel) -> Bool{
        shareInstace.database?.open()
        
        let save = shareInstace.database?.executeUpdate("insert into statis (book_id,book_name,name,identity,phone,image,create_time,type) values(?, ?, ?, ?, ?, ?, ?, ?)"
            , withArgumentsIn: [borrow_book.book_id, borrow_book.book_name,borrow_book.borrower_name, borrow_book.borrower_identity, borrow_book.borrower_phone,borrow_book.image, borrow_book.create_time,1])
        shareInstace.database?.close()
        
        return save!
    }
    
    func returnBook(borrow_book: BorrowBookModel) -> Bool{
        shareInstace.database?.open()
        
        let isInsert = shareInstace.database?.executeUpdate("insert into return_books (book_id,book_name,image,return_name,return_identity,return_phone,create_time) values(?, ?, ?, ?, ?, ?, ?)"
            , withArgumentsIn: [borrow_book.book_id, borrow_book.book_name,borrow_book.image, borrow_book.borrower_name, borrow_book.borrower_identity, borrow_book.borrower_phone, borrow_book.create_time])
    
        return isInsert!
    }
    
    
}
