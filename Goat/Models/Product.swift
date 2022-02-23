//
//  Product.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Firebase

struct Product: Identifiable {
    let id: String // for each product
    
    // items
    var name : String
    var description: String
    var isAdded : Bool
    var cost : Float// NSNumber
    var likes : Int
    var taxed: Bool
    var variantItem : Bool
    var size: [String]
    var sizeType : Int
    var sizePricing :  [Float]
    var sizeQuantity :[Int]
    var quantity : Int
    var onSale: Bool
    var onSalePrice : Float // change to nsNumber
    var tags : [String]
    var brand : String
    var category : String
    var sku : String
    var mainColor : String
    var want : Bool
    var releaseDate : String
    var images : [String]
    var onAppImages: [String]
    var soldOut : Bool
    var row : Int
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
        self.name = dictionary["name"] as? String ?? ""
        self.description = dictionary["description"] as? String ?? ""
        self.isAdded = dictionary["isAdded"] as? Bool ?? false
        self.variantItem = dictionary["variantItem"] as? Bool ?? false
        self.cost = dictionary["cost"] as? Float ?? 0.0
        self.likes = dictionary["likes"] as? Int ?? 0
        self.taxed = dictionary["taxed"] as? Bool ?? false
        self.onSale = dictionary["onSale"] as? Bool ?? false
        self.onSalePrice = dictionary["onSalePrice"] as? Float ?? 0.0
        self.want = dictionary["want"] as? Bool ?? false
        self.images = dictionary["images"] as? [String] ?? [""]
        self.tags = dictionary["tags"] as? [String] ?? [""]
        self.brand = dictionary["brand"] as? String ?? ""
        self.category = dictionary["category"] as? String ?? ""
        self.sku = dictionary["sku"] as? String ?? ""
        self.mainColor = dictionary["mainColor"] as? String ?? ""
        self.releaseDate = dictionary["releaseDate"] as? String ?? ""
        self.onAppImages = dictionary["onAppImages"] as? [String] ?? [""]
        self.size = dictionary["size"] as? [String] ?? [""]
        self.sizeType  = dictionary["sizeQuantity"] as? Int ?? 0
        self.sizePricing  = dictionary["sizePricing"] as? [Float] ?? [0.0]
        self.sizeQuantity  = dictionary["sizeQuantity"] as? [Int] ?? [0]
        self.quantity = dictionary["quantity"] as? Int ?? 0
        self.soldOut = dictionary["soldOut"] as? Bool ?? false
        self.row = dictionary["row"] as? Int ?? 0

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
     //   formatter.dateFormat = "h:mm a · MM/dd/yyyy"

        formatter.dateFormat = "MM|dd|yyyy"
        return formatter.string(from: timestamp.dateValue())
    }
}


//
//extension Array where Element == ProductSize {
//    func formatForFirebase() -> [[String:Any]]{
//        var returnVal:[[String:Any]] = []
//        for element in self {
//            returnVal.append(element.ProductSize(dictionary: $0.data()))
//
//            self.productSizes = ProductSize(dictionary: $0.data())
//
//            productSize.append(ProductSize(dictionary: ["name" : sizes[0],
//                                                        "amount" : amount,
//                                                        "amountUnit" : ProductSizeUnit(rawValue: "XS")!
//            ]))
//        }
//
//        return returnVal
//    }
//
//}
