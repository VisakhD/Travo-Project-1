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

        let container = NSPersistentContainer(name: "TravoProject1Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

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
