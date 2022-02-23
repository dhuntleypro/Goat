//
//  SubscriptionType.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//

import SwiftUI
import Firebase
import StoreKit

struct SubscriptionType : Identifiable {
    
    let name : String
  //  let description :  String
    let subscriptionType : String
    let storeSelected : Bool
    let price : Double
    let yearPrice : Double
    let salePrice : Double    
    let onSale : Bool
    let image : String
 //   let imageName : String
    let icon : String
    let subscriptionSortCount : Int
    let features : [String]
    
    // payment
//    var title : String
//    let cost : String?
//    var isLocked : Bool
//    let locale: Locale
  
    
    let toId : String
    let timestamp: Timestamp
    let id: String
    
    lazy var formatter : NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
     //   nf.locale = locale
        return nf
    }()
    
    
 //   init(dictionary: [String : Any] , product: SKProduct, isLocked: Bool = true) {
    init(dictionary: [String : Any]) {

//        self.id = product.productIdentifier
//        self.title = product.localizedTitle
//        self.description = product.localizedDescription
//        self.isLocked = isLocked
//        self.locale = product.priceLocale
//        self.imageName = product.productIdentifier

//       if isLocked {
//            self.cost = formatter.string(from: product.price)
//       }
        
        self.name = dictionary["name"] as? String ?? ""
        self.subscriptionType = dictionary["subscriptionType"] as? String ?? ""
        self.storeSelected  = dictionary["storeSelected"] as? Bool ?? false
        self.price = dictionary["price"] as? Double ?? 0.0
        self.yearPrice = dictionary["yearPrice"] as? Double ?? 0.0
        self.onSale = dictionary["onSale"] as? Bool ?? false
        self.salePrice = dictionary["salePrice"] as? Double ?? 0.0
        self.icon = dictionary["icon"] as? String ?? ""
        self.subscriptionSortCount = dictionary["subscriptionSortCount"] as? Int ?? 0
        self.features = dictionary["features"] as? [String] ?? [""]
        self.image = dictionary["image"] as? String ?? ""
        
        
        
        self.toId = dictionary["toId"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
       self.id = dictionary["id"] as? String ?? ""
    }
}


