//
//  ListViewController.swift
//  Lab_A1_A2_iOS_mohammedmasiuddin_c0796887
//
//  Created by user204338 on 9/22/21.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var tableviewlist: UITableView!
    var index : Int?
    var prodlist : [Products]?
    var prov : Provider?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableviewlist.delegate = self
        tableviewlist.dataSource = self
        prodlist = prov?.productslist?.allObjects as? [Products]
//        print(prodlist)
        print("timer")
        print(prodlist!.count as Int)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prodlist!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableviewlist.dequeueReusableCell(withIdentifier: "listcells", for: indexPath) as! ListTableViewCell
        cell.listnameproduct.text = prodlist![indexPath.row].product_name
        print("ioio")
        return cell
    }


}
