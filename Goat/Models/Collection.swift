//
//  Collection.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//



import SwiftUI
import Firebase

struct Collection: Identifiable {
    let id: String // for each product
    
    // items
    let title : String
    let caption : String
    let description: String
    var amount : Int
    let likes : Int
    var onSale: Bool
    var image : String
    var images : [String]
    var imagesURL : String
    var sequenceCount : Int
    var conditions : [String]
  
    var active: Bool
    
    // user
    let username: String
    let profileImageURL: String
    let fullname: String
    let uid : String // for each user
    
    let timestamp: Timestamp
    
    init(dictionary : [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        
        // items
        self.title = dictionary["title"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.amount = dictionary["amount"] as? Int ?? 0
        self.likes = dictionary["likes"] as? Int ?? 0
        self.onSale = dictionary["onSale"] as? Bool ?? false
        self.image = dictionary["image"] as? String ?? ""

        self.images = dictionary["images"] as? [String] ?? [""]
        self.imagesURL = dictionary["imagesURL"] as? String ?? ""
        self.sequenceCount = dictionary["sequenceCount"] as? Int ?? 0
        self.conditions = dictionary["conditions"] as? [String] ?? [""]
     
        self.active = dictionary["active"] as? Bool ?? false

            
        // user
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())

    }
    
    // 4d (time abbreviated)
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth, .day, .month, .year]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        
        // AGE
     //   return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
        
        // CREATION DATE
        return formatter.string(for: timestamp.dateValue()) ?? ""

        
    }
    
    var detailedTimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a · MM/dd/yyyy"
        return formatter.string(from: timestamp.dateValue())
    }
    
    
    
}
