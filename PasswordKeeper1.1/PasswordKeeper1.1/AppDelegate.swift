//
//  AppDelegate.swift
//  PasswordKeeper1.1
//
//  Created by Van Anh on 5/15/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    
    //var loginVC
    
    static var managedObjectContext: NSManagedObjectContext?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("phuong thuc cho phep ban thuc hien bat ki khoi tao cuoi nao truoc khi app cua ban duoc hien thi cho nguoi dung")
        print(#function)
        // Override point for customization after application launch.
        AppDelegate.managedObjectContext = persistentContainer.viewContext
        return true
    }

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("phuong nay la co hoi dau tien cua ung dung de thuc thi ma khi khoi chay \(#function)")
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
        print("phuong thuc nay cho phep ban biet rang ung dung cua ban dang chuyen doi khoi ung dung nen truoc. Su dung phuong thuc nay de dua ung dung cua ban vao trang thai k hoat dong")
        print(#function)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Cho phep ban biet rang ung dung cua ban hien dang chay trong nen va co the bi treo bat cu luc nao")
        print(#function)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Cho phep ban biet rang ung dung cua ban dang di chuyen ra khoi nen va quay tro lai nen truoc nhung no van chua hoat dong")
        print(#function)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("cho phep ung dung cua ban biet rang ung dung sap tro thanh ung dung nen truoc \(#function)")
        print(#function)
      
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
        print("phuong thuc nay cho phep ban biet rang ung dung cua ban dang bi cham dut, phuong thuc nay khong duoc goi neu ung dung cua ban bi tam ngung")
    }
    
    
//    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
//        print("phuong thuc nay la co hoi dau tien cua ung dung de thuc thi ma khi khoi chay")
//        return true
//    }
    

    

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "PasswordKeeper1_1")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
}

