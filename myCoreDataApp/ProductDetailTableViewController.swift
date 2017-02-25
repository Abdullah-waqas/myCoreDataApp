//
//  ProductDetailTableViewController.swift
//  myCoreDataApp
//
//  Created by Abdullah on 23/02/2017.
//  Copyright © 2017 Abdullah. All rights reserved.
//

import UIKit
import CoreData

class ProductDetailTableViewController: UITableViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var setProductDetail: UITextView!
    @IBOutlet weak var setProductPrice: UITextField!
    @IBOutlet weak var setProductName: UITextField!
    @IBOutlet weak var setProductImage: UIImageView!

    var managedObjectContext : NSManagedObjectContext? {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    @IBAction func pickImage(_ sender: UITapGestureRecognizer) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        
        let alertController = UIAlertController(title: "Add a Picture", message: "Choose From", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){(action) in
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default){(action) in
            pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
        }
        
        let savePhotoAlbumAction = UIAlertAction(title: "Saved Photo Album", style: .default){(action) in
            pickerController.sourceType = .savedPhotosAlbum
            self.present(pickerController, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(savePhotoAlbumAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.setProductImage.image = image
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveBarButton()
    }
    
    func addSaveBarButton(){
        let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(ProductDetailTableViewController.saveProduct))
        navigationItem.rightBarButtonItem = saveBarButton
    }
    func saveProduct(){
        print(setProductImage.image?.accessibilityLabel as Any)
//        if( (setProductName.text!.isEmpty) || (setProductPrice.text!.isEmpty) || setProductDetail.text.isEmpty || setProductImage.image == nil){
//            let alertController = UIAlertController(title: "OOPS", message: "Please fill all required information", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            self.present(alertController, animated: true, completion: nil)
//            
//        }else{
//            if let moc = managedObjectContext {
//                let product = Product(context: moc)
//                product.productName = setProductName.text!
//                product.productDescription = setProductDetail.text!
//                product.productPrice = Float(setProductPrice.text!)!
//                
//                if  let data = UIImageJPEGRepresentation(self.setProductImage.image!, 1.0){
//                    product.productImage = data as NSData
//                }
//                saveToCoreData(){
//                    self.navigationController!.popToRootViewController(animated: true)
//                }
//            }
//            
//        }
    }
    func saveToCoreData(completion: @escaping () -> Void){
        managedObjectContext?.perform {
            do{
                try self.managedObjectContext?.save()
                completion()
                print("Saved Successfully")
            }catch let error{
                print("Could not save product to coreData \(error.localizedDescription)")
            }
        }
        
        
    }

}
