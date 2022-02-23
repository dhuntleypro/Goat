//
//  Order.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/23/21.
//

import SwiftUI
import Firebase
import Foundation



struct Order: Identifiable {
    
    
    var id: String
    let username: String
    let fullname : String
    let customerId: String
    let profileImageURL: String
    let orderItems: [Product] = []
    let amount: Double!
    let total: Double

    // shipping
    let address : String
    let city : String
    let state : String
    let zip : String
    
    // contact
    let phoneNumber : String
    let email : String
    
    
    let customerName: String
    let isCompleted: Bool
    let uid : String // for each user
    let timestamp: Timestamp
    
    
    
    init(dictionary : [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
     
        self.username = dictionary["username"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.customerId = dictionary["customerId"] as? String ?? ""
        self.amount = dictionary["amount"] as? Double ?? 0.0
        self.total = dictionary["total"] as? Double ?? 0.0

        self.address = dictionary["address"] as? String ?? ""
        self.city = dictionary["city"] as? String ?? ""
        self.state = dictionary["state"] as? String ?? ""
        self.zip = dictionary["zip"] as? String ?? ""

        self.phoneNumber = dictionary["phoneNumber"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        
        self.customerName = dictionary["customerName"] as? String ?? ""
        self.isCompleted = dictionary["isCompleted"] as? Bool ?? false
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        
        
        self.uid = dictionary["uid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        
    }
    
}
