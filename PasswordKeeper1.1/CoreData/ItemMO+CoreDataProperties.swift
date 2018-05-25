//
//  ItemMO+CoreDataProperties.swift
//  PasswordKeeper1.1
//
//  Created by Van Anh on 5/16/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//
//

import UIKit
import CoreData


extension ItemMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemMO> {
        return NSFetchRequest<ItemMO>(entityName: "Item")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var nameapp: String?
    @NSManaged public var id: Int32
    @NSManaged public var icon: NSData?
    
    
    static func insertNewItem(id : Int32, nameapp : String, username : String, password: String)->ItemMO?{
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: AppDelegate.managedObjectContext!) as! ItemMO
            
        item.id = id
        item.nameapp = nameapp
        item.username = username
        item.password = password
        
        let imageData: NSData = UIImagePNGRepresentation(#imageLiteral(resourceName: "icon"))! as NSData
        
        item.icon = imageData

        do {
            try AppDelegate.managedObjectContext?.save()
        } catch  {
            let nserror = error as NSError
            print("Can not insert new item. Error is : \(nserror), \(nserror.userInfo)")
            return nil
        }
        print("Insert item successful with name: \(item.nameapp ?? "")")
        return item
    }

    static func getAllItem() ->[ItemMO]{
        var result = [ItemMO]();
        let moc = AppDelegate.managedObjectContext
        do {
            result = try moc!.fetch(ItemMO.fetchRequest()) as! [ItemMO]
        } catch {
            print("Can not fetch items, error is: \(error)")
            return result
        }
        return result

        
    }
    static func deleteItem(item : ItemMO) -> Bool{
        let moc = AppDelegate.managedObjectContext
        moc?.delete(item)
        do {
            try moc?.save()
            print("your item choice deleted")
            return true
        } catch  {
            print("error delete")
            return false
        }
        
    }
    
    static func deleteAllItem() -> Bool{
        let moc = AppDelegate.managedObjectContext
        let items = ItemMO.getAllItem()
        for item in items{
            moc?.delete(item)
        }
        do {
            try AppDelegate.managedObjectContext?.save()
        } catch  {
            let nserror = error as NSError
            print("Can not delete, error is: \(nserror), infor: \(nserror.userInfo)")
            return false
        }
        print("Delete successful")
        return true
    }
    
//    static func filterData() -> [ItemMO]? {
//        let moc = AppDelegate.managedObjectContext
//        
//    }

}
