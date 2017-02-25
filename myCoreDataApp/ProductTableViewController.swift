//
//  ProductTableViewController.swift
//  myCoreDataApp
//
//  Created by Abdullah on 23/02/2017.
//  Copyright © 2017 Abdullah. All rights reserved.
//

import UIKit
import CoreData

class ProductTableViewController: UITableViewController {
    var productsArray = [Product]()
    var managedObjectContext : NSManagedObjectContext? {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    override func viewWillAppear(_ animated: Bool) {
        retrieveProducts()
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productsArray.count
    }

    let cellID = "productCell"

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProductTableViewCell
        cell.configureCell(product: productsArray[indexPath.row])
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(ProductTableViewController.deleteRecord), for: .touchUpInside)
        return cell
    }
    func deleteRecord(sender: UIButton){
        let alertController = UIAlertController(title: "Warning", message: "Do You want to remove this details", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let yes = UIAlertAction(title: "Yes", style: .default){
            UIAlertAction in
            self.managedObjectContext?.delete(self.productsArray[sender.tag])
            self.retrieveProducts()
        }
        alertController.addAction(yes)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
        print(productsArray[sender.tag])
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 1.2, animations: {
//            cell.alpha = 1.0
//        })
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(productsArray[indexPath.row])
    }
    
    
    func retrieveProducts(){
        fetchProductsFromCoreData { (products) in
            if let products = products {
                self.productsArray = products
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchProductsFromCoreData(completion: ([Product]?) -> Void){
        var results = [Product]()
        let request : NSFetchRequest<Product> = Product.fetchRequest()
        do{
            results = try managedObjectContext!.fetch(request)
            completion(results)
        }catch{
            print("Could not able to fetch data \(error.localizedDescription)")
        }
    }
 

}
