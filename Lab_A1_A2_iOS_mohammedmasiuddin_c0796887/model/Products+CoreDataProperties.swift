//
//  Products+CoreDataProperties.swift
//  Lab_A1_A2_iOS_mohammedmasiuddin_c0796887
//
//  Created by user204338 on 9/20/21.
//
//

import Foundation
import CoreData


extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var procduct_price: Int64
    @NSManaged public var product_description: String?
    @NSManaged public var product_id: Int64
    @NSManaged public var product_name: String?
    @NSManaged public var product_provider: Provider?

}

extension Products : Identifiable {

}
