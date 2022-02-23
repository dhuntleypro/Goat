//
//  Cart.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Firebase

struct Cart: Identifiable {
    let id: String
    
    
    // var id: String!
    var ownerId: String!
    var items: [Product] = []
    var name : String
    var image : String
    var demoImage : [String]
    var quantity : Int
    var size : String
    var cost : Float
    var offset : CGFloat
    var isSwiped : Bool
    
//
//        var total: Double {
//            if items.count > 0 {
//                return items.reduce(0) { $0 + $1.cost + $1.quantity }
//            } else {
//                return 0.0
//            }
//        }
//
    //    func add(_ item: Product) {
    //        items.append(item)
    //    }
    //
    //    func remove(_ item: Product) {
    //
    //        if let index = items.firstIndex(of: item) {
    //            items.remove(at: index)
    //        }
    //    }
    //


    let uid : String // for each user
    
    let timestamp: Timestamp
    
    init(dictionary : [String: Any]) {
        self.id = dictionary["id"] as? String ?? ""
        
        self.name = dictionary["name"] as? String ?? ""
        self.size = dictionary["size"] as? String ?? ""
        self.quantity = dictionary["quantity"] as? Int ?? 0
        self.image = dictionary["images"] as? String ?? ""
        self.cost = dictionary["cost"] as? Float ?? 0.0
        self.demoImage = dictionary["demoImage"] as? [String] ?? [""]
        self.offset = dictionary["offset"] as? CGFloat ?? 0.0
        self.isSwiped = dictionary["isSwiped"] as? Bool ??  false
        
        
        
        self.uid = dictionary["uid"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        
    }
    
}
