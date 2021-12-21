//
//  UserDetails+CoreDataProperties.swift
//  Travo Project 1
//
//  Created by Visakh D on 21/12/21.
//
//

import Foundation
import CoreData


extension UserDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetails> {
        return NSFetchRequest<UserDetails>(entityName: "UserDetails")
    }

    @NSManaged public var token: String?
    @NSManaged public var mobileNumber: String?
    @NSManaged public var following: String?
    @NSManaged public var followers: String?
    @NSManaged public var email: String?
    @NSManaged public var username: String?
    @NSManaged public var name: String?

}

extension UserDetails : Identifiable {

}
