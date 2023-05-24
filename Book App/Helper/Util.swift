//
//  Util.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import Foundation


class Util{
    
    static let share = Util()
    
    
    func getPath(fileName: String) -> String{
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let fileUrl = documentDirectory.appendingPathComponent(fileName)
        
        print("Database path:- \(fileUrl.path)")
        return fileUrl.path
    }
    
    func copyDatabase(fileName: String){
        let dbPath = getPath(fileName: "BookApp.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(fileName)

            do{
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dbPath)
            }catch let error{
                print(error.localizedDescription)
            }

        }
    }
}
