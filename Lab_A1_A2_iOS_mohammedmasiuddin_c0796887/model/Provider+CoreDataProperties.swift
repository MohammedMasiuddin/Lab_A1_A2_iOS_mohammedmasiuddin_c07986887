//
//  Provider+CoreDataProperties.swift
//  Lab_A1_A2_iOS_mohammedmasiuddin_c0796887
//
//  Created by user204338 on 9/20/21.
//
//

import Foundation
import CoreData


extension Provider {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Provider> {
        return NSFetchRequest<Provider>(entityName: "Provider")
    }

    @NSManaged public var name: String?
    @NSManaged public var productslist: NSSet?

}

// MARK: Generated accessors for productslist
extension Provider {

    @objc(addProductslistObject:)
    @NSManaged public func addToProductslist(_ value: Products)

    @objc(removeProductslistObject:)
    @NSManaged public func removeFromProductslist(_ value: Products)

    @objc(addProductslist:)
    @NSManaged public func addToProductslist(_ values: NSSet)

    @objc(removeProductslist:)
    @NSManaged public func removeFromProductslist(_ values: NSSet)

}

extension Provider : Identifiable {

}
