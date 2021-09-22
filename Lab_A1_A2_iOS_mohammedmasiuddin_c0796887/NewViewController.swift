//
//  NewViewController.swift
//  Lab_A1_A2_iOS_mohammedmasiuddin_c0796887
//
//  Created by user204338 on 9/22/21.
//

import UIKit
import CoreData

class NewViewController: UIViewController, UITextFieldDelegate {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tableview : UITableView?

    
    @IBOutlet weak var descriptionOfProduct: UITextField!
    @IBOutlet weak var priceOfProduct: UITextField!
    @IBOutlet weak var newprovider: UITextField!
    @IBOutlet weak var nameOfNewProduct: UITextField!
    
    @IBOutlet weak var productIdOfProducts: UITextField!
    
    @IBAction func cancelbtn(_ sender: Any) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionOfProduct.delegate = self
        priceOfProduct.delegate = self
        newprovider.delegate = self
        nameOfNewProduct.delegate = self
        productIdOfProducts.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        descriptionOfProduct.resignFirstResponder()
        priceOfProduct.resignFirstResponder()
        newprovider.resignFirstResponder()
        nameOfNewProduct.resignFirstResponder()
        productIdOfProducts.resignFirstResponder()
        
        return true
    }
    
    @IBAction func savebuttonclicked(_ sender: Any) {
        let prod = Products(context: context)
        let v = Int(priceOfProduct.text!)
        prod.procduct_price = Int64(v!)
        prod.product_description = descriptionOfProduct.text
        let b = Int(productIdOfProducts.text!)
        prod.product_id = Int64(b!)
        prod.product_name = nameOfNewProduct.text
        
        var provs: [Provider]?
        do {
            let request = Provider.fetchRequest() as NSFetchRequest<Provider>
            
            let str = "name = '\(newprovider.text!)'"
            
            let prod = NSPredicate(format: str)
            request.predicate = prod
            
            provs = try context.fetch(request)
            
//            print(provs)
            
        } catch {
            print("some error")
        }
        
        provs = provs != nil ? provs : []
        
        if provs!.count > 0 {
            print("if provider present")
            prod.product_provider = provs![0]
            
        }else{
            print("no provider")
            let provider = Provider(context: context)
            provider.name = newprovider.text
            
            prod.product_provider = provider
        }
        
        
        
        do {
            try context.save()
        } catch  {}
        
        tableview?.reloadData()
        
    }
}
