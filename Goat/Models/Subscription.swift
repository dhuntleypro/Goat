//
//  Subscription.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//

import SwiftUI
import Firebase

struct Subscription : Identifiable {
    
    let name : String
    let description :  String
    let subscriptionType : String
//    let storeSelected : Bool
//    let price : Double
//    let salePrice : Double
//    let onSale : Bool
    let image : String
    
    let icon : String
    let subscriptionSortCount : Int
 //   let features : [String]
  
    
    let toId : String
    let timestamp: Timestamp
    let id: String
    
//    var chatPartnerId:  String { return isFromCurrentUser ? toId : fromId }
    
    init(dictionary: [String : Any]) {
    //    self.user = user
        
        
        self.name = dictionary["name"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.subscriptionType = dictionary["subscriptionType"] as? String ?? ""
    //    self.storeSelected  = dictionary["storeSelected"] as? Bool ?? false
    //    self.price = dictionary["price"] as? Double ?? 0.0
    //    self.onSale = dictionary["onSale"] as? Bool ?? false
    //    self.salePrice = dictionary["salePrice"] as? Double ?? 0.0
        self.icon = dictionary["icon"] as? String ?? ""
        self.subscriptionSortCount = dictionary["subscriptionSortCount"] as? Int ?? 0
   //     self.features = dictionary["features"] as? [String] ?? [""]
        self.image = dictionary["image"] as? String ?? ""

        
        
        self.toId = dictionary["toId"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}


