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

    @NSManaged public var email: String?
    @NSManaged public var followers: Int64
    @NSManaged public var following: Int64
    @NSManaged public var mobileNumber: String?
    @NSManaged public var name: String?
    @NSManaged public var token: String?
    @NSManaged public var user_name: String?

}

extension UserDetails : Identifiable {

}
