//
//  ViewController.swift
//  Lab_A1_A2_iOS_mohammedmasiuddin_c0796887
//
//  Created by user204338 on 9/19/21.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var showproviderbtn: UIButton!
    var showproviders = false
    var index :Int = 0
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var product:[Products]?
    var provid : [Provider]?
    
    
    let defaults = UserDefaults.standard
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
          
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
//        print(defaults.bool(forKey: "FirstLaunch"))
        
        if !defaults.bool(forKey: "FirstLaunch") {
            createNewProducts()
            defaults.setValue(true, forKey: "FirstLaunch")
        }
        
        do {
            self.product = try context.fetch(Products.fetchRequest())
            self.provid = try context.fetch(Provider.fetchRequest())
        } catch  {
            
        }

    }
    
    func createNewProducts () {
        
        print("Inserting the initial products to the core data")
        
        let keyboard = Products(context: context)
        keyboard.product_name = "keyboard"
        keyboard.procduct_price = 12
        keyboard.product_description = "Logitech keyboard"
        keyboard.product_id = 111
        
        let ikea = Provider(context: context)
        ikea.name = "ikea"
        
        keyboard.product_provider = ikea
        
        let bike = Products(context: context)
        bike.product_name = "Bike"
        bike.procduct_price = 120
        bike.product_description = "New bike"
        bike.product_id = 112
        
        let walmart = Provider(context: context)
        walmart.name = "walmart"
        
        bike.product_provider = walmart
        
        let laptop = Products(context: context)
        laptop.product_name = "Laptop"
        laptop.procduct_price = 900
        laptop.product_description = "msi laptop"
        laptop.product_id = 113
        
        let bestbuy = Provider(context: context)
        bestbuy.name = "bestbuy"
        
        laptop.product_provider = bestbuy
        
        let tv = Products(context: context)
        tv.product_name = "tv"
        tv.procduct_price = 900
        tv.product_description = "LED TV of samsung "
        tv.product_id = 114
        
        tv.product_provider = walmart
        
        let lamp = Products(context: context)
        lamp.product_name = "lamp"
        lamp.procduct_price = 900
        lamp.product_description = "led lamp"
        lamp.product_id = 115
            
        lamp.product_provider = walmart

        let xbox = Products(context: context)
        xbox.product_name = "xbox"
        xbox.procduct_price = 900
        xbox.product_description = "gaming xbox"
        xbox.product_id = 116
            
        xbox.product_provider = walmart
        
        let pan = Products(context: context)
        pan.product_name = "pan"
        pan.procduct_price = 900
        pan.product_description = " teflon pan"
        pan.product_id = 117
            
        pan.product_provider = walmart
        
        let utensils = Products(context: context)
        utensils.product_name = "utensils"
        utensils.procduct_price = 900
        utensils.product_description = "steel utensils "
        utensils.product_id = 118
            
        utensils.product_provider = walmart
        
        let chair = Products(context: context)
        chair.product_name = "chair"
        chair.procduct_price = 30
        chair.product_description = "timber confortable chair"
        chair.product_id = 119
        
        chair.product_provider = ikea
           
        
        let phone = Products(context: context)
        phone.product_name = "phone"
        phone.procduct_price = 600
        phone.product_description = "iphone"
        phone.product_id = 120
        
        phone.product_provider = bestbuy
        
        do {
            try context.save()
            
        } catch  {
//            print("error will saving data")
        }
        
    }
    
    @IBAction func changeList(_ sender: Any) {

        print("hello")
        if showproviders{
            showproviderbtn.setTitle("show providers", for: .normal)
            navigationItem.title = "Products"

        }else{
            showproviderbtn.setTitle( "show products", for: .normal)
            navigationItem.title = "Providers"


        }
        showproviders = !showproviders

        tableview.reloadData()
        


    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if showproviders {
            return provid!.count
        }else{
//
        if let c = product?.count {
            return c
        }
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if showproviders{

            let cell = tableview.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! ProductsTableViewCell
            let item = self.provid![indexPath.row]
            cell.imageView?.image = UIImage(systemName: "folder.fill")
            cell.Providername.text = "\(item.productslist!.count)"
            cell.ProductName.text = item.name

            return cell


        }
                
        let cell = tableview.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! ProductsTableViewCell
        
        let item = self.product![indexPath.row]
        let supplier = item.product_provider!
        cell.imageView?.image = nil
        cell.ProductName.text = item.product_name
        cell.Providername.text = supplier.name
        
//        print(item,supplier)
        
        return cell
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchbutton clicked ")
        
        let searchvalue = searchBar.text!
        print(searchvalue)
        
        do {
            let request = Products.fetchRequest() as NSFetchRequest<Products>
            
            let str = "product_name CONTAINS[c] '\(searchvalue)' OR product_description CONTAINS[C] '\(searchvalue)' "
            
            let prod = NSPredicate(format: str)
            request.predicate = prod
            
            self.product = try context.fetch(request)
            
            tableview.reloadData()
            
        } catch {
            print("some error")
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        index = indexPath.row
        if showproviders {
            self.performSegue(withIdentifier: "listproducts", sender: self)
        }else{
        index = indexPath.row
        self.performSegue(withIdentifier: "showSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSegue"{
        
        let  editviewcontroller = segue.destination as! EditViewController
        	

        let pr = product![index]
        
        editviewcontroller.prod_id = index
        editviewcontroller.product = pr
        editviewcontroller.tableview = tableview
        }
        
        if segue.identifier == "addproducts" {
            let  newviewcontroller = segue.destination as! NewViewController
            newviewcontroller.tableview = tableview

        }
        
        if segue.identifier == "listproducts"{
            let listviewcontroller = segue.destination as! ListViewController
            listviewcontroller.prov = provid![index]
            listviewcontroller.index = index
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            
            if self.showproviders{
                let prov = self.provid![indexPath.row]
                self.context.delete(prov)
               
                self.provid?.remove(at: indexPath.row)
            }else{
                let iten = self.product![indexPath.row]
                self.context.delete(iten)
                self.product?.remove(at: indexPath.row)
                
            }
            do{
                try self.context.save()
            }catch{}
            
            self.tableview.deleteRows(at: [indexPath], with: .automatic)
            complete(true)
        }
        
        deleteAction.backgroundColor = .red
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = true
        return config
    }
    

    @IBAction func unwindTo(_ unwindSegue: UIStoryboardSegue) {
        viewDidLoad()
    }
    
    
}

