//
//  EditViewController.swift
//  Lab_A1_A2_iOS_mohammedmasiuddin_c0796887
//
//  Created by user204338 on 9/20/21.
//

import UIKit

class EditViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var nameOfProduct: UITextField!

    @IBOutlet weak var idOfProduct: UITextField!
    
    @IBOutlet weak var priceofproduct: UITextField!
    
    @IBOutlet weak var descriptionofproduct: UITextField!
    @IBOutlet weak var ProviderOfProduct: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    var prod_id: Int = 0
    var tableview : UITableView?
    var product:Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        	
        print(prod_id)
        print(product?.product_name)
        
        nameOfProduct.delegate = self
        idOfProduct.delegate = self
        priceofproduct.delegate = self
        descriptionofproduct.delegate = self
        ProviderOfProduct.delegate = self
        
        nameOfProduct.text = product?.product_name
        idOfProduct.text = "\(product!.product_id)"
        priceofproduct.text = "\(product!.procduct_price)"
        
        descriptionofproduct.text = "\(product!.product_description!)"
        
        ProviderOfProduct.text = "\(product!.product_provider!.name!)"
        
    }
    

    @IBAction func saveButtonClicked(_ sender: Any) {
        print("save dbutton clicked")
        print(product)
        product?.product_name = nameOfProduct.text
        let price = Int(priceofproduct.text!)
        product?.procduct_price = Int64(price!)
        let uid = Int(idOfProduct.text!)
        product?.product_id = Int64(uid!)
        product?.product_description = descriptionofproduct.text
        
        let prov = Provider(context: context)
        prov.name = ProviderOfProduct.text
        product?.product_provider = prov
        
        do {
            try context.save()
        } catch { }
        
        tableview?.reloadData()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        nameOfProduct.resignFirstResponder()
        idOfProduct.resignFirstResponder()
        priceofproduct.resignFirstResponder()
        descriptionofproduct.resignFirstResponder()
        ProviderOfProduct.resignFirstResponder()
        
        return true
    }
}
