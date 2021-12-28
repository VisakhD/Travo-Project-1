//
//  Manager.swift
//  Travo Project 1
//
//  Created by Visakh D on 16/12/21.
//

import Foundation
import CoreData


class CoreData {
    
    static let shared = CoreData()
    var userData : [UserDetails]?
     
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "TravoProject1Model")
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
    private init () {}
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
//     saving data into core data
    
    func signUpUserDetails (name : String, username : String,following : Int, followers : Int, mobileNumber : String, email : String, token : String) {
        let context = persistentContainer.viewContext
        
        let user  = NSEntityDescription.insertNewObject(forEntityName: "UserDetails", into: context)  as! UserDetails
        
        user.setValue(name, forKey: "name")
        user.setValue(username, forKey: "user_name")
        user.setValue(following, forKey: "following")
        user.setValue(followers, forKey: "followers")
        user.setValue(mobileNumber, forKey: "mobileNumber")
        user.setValue(email, forKey: "email")
        user.setValue(token, forKey: "token")
        
        try! context.save()
        print("save sucess")
    }
    
    
    
    
    
}
