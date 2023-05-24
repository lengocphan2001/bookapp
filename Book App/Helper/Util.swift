//
//  Util.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import Foundation


class Util : NSObject{
    class func getPath(fileName: String) -> String{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        
        print("Database path:- \(fileUrl.path)")
        return fileUrl.path
    }
    
    class func copyDatabase(fileName: String){
        let dbPath = getPath("Book.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(fileName)
            var error:NSError?
            do{
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dbPath)
            }catch let error1 as NSError{
                error = error1
            }
            
            if error == nil{
                print("Fail")
            }else{
                print("Done")
            }
        }
    }
}
