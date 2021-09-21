//
//  EditViewController.swift
//  Lab_A1_A2_iOS_mohammedmasiuddin_c0796887
//
//  Created by user204338 on 9/20/21.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var nameOfProduct: UITextField!

    @IBOutlet weak var idOfProduct: UITextField!
    
    @IBOutlet weak var priceofproduct: UITextField!
    
    @IBOutlet weak var descriptionofproduct: UITextField!
    @IBOutlet weak var ProviderOfProduct: UITextField!
    //    @IBOutlet weak var product_description: UITextField!
//    @IBOutlet weak var provider_name: UITextField!
//    
    var prod_id: Int = 0
    var product:Products?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(prod_id)
        print(product)
        
        nameOfProduct.text = product?.product_name
        idOfProduct.text = "\(product!.product_id)"
        priceofproduct.text = "\(product!.procduct_price)"
        
        descriptionofproduct.text = "\(product!.product_description!)"
        
        ProviderOfProduct.text = "\(product!.product_provider!.name!)"
        
    }
    


}
