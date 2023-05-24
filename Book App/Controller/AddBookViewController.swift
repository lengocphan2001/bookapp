//
//  AddBookViewController.swift
//  Book App
//
//  Created by ngocphan on 5/24/23.
//  Copyright © 2023 ngocphan. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {
    @IBOutlet weak var txtBookNam: UITextField!
    @IBOutlet weak var txtBookAuthor: UITextField!
    @IBOutlet weak var txtBookQuantity: UITextField!
    @IBOutlet weak var txtBookCompany: UITextField!
    @IBOutlet weak var txtBookType: UITextField!
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var imgBookImage: UIImageView!
    
    var book : BookModel?
    var header = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if header != "" {
            self.title = header
            imgBookImage.image = UIImage(data: book?.image as! Data)
            txtBookNam.text = book?.name
            txtBookAuthor.text = book?.author
            txtBookQuantity.text = book?.quantity
            txtBookType.text = book?.type
            txtBookCompany.text = book?.company
            btnAdd.setTitle("Sửa sách", for: .normal)
            
        }

        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnAddBookClick(_ sender: Any) {
        let image = imgBookImage.image!.pngData() as NSData?
        
        if header == ""{
            let book = BookModel(id: "", name: txtBookNam.text!, author: txtBookAuthor.text!, company: txtBookCompany.text!, type: txtBookType.text!, quantity: txtBookQuantity.text!, image: image! as Data, create_time: Date())
            
            let isSave = ModelManager.getInstance().saveBook(book: book)
            print("Is save: \(isSave)")
        }else{
            let bookNew = BookModel(id: (self.book?.id)!, name: txtBookNam.text!, author: txtBookAuthor.text!, company: txtBookCompany.text!, type: txtBookType.text!, quantity: txtBookQuantity.text!, image: image! as Data, create_time: Date())
            
            let isUpdate = ModelManager.getInstance().updateBook(book: bookNew)
            
            print("is update: \(isUpdate)")
        }
        
        
    }
    @IBAction func btnChooseImageClick(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }

}

extension AddBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imgBookImage.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)    }
}
