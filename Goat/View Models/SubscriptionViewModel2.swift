//
//  SubscriptionViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//



import SwiftUI
import Firebase // may not need
import FirebaseAuth
import CryptoKit

class SubscriptionViewModel2 : ObservableObject {
    @Published var subscriptions = [Subscription]()
  //  static let shared : Subscription
    
    @Published var userSession : FirebaseAuth.User?  // keep track if user is logged in
    static let shared = SubscriptionViewModel()
    
    var id : String?
    var name : String = "Ecommerce"
    var description :  String = "Sell your Products here"
    var subscriptionType : String = ""
    var storeSelected : Bool = false
    var price : Double = 300
    var yearPrice : Double = 0
    var onSale : Bool = false
    var salePrice : Double = 40.00
    var icon : String = "cart"
    
    
    init() {

        fetchSubscriptions()
    }
//
    // list of all tweets
    func fetchSubscriptions() {
        COLLECTION_SUBSCRIPTIONS
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.subscriptions = documents.map({ Subscription(dictionary: $0.data())})
            }
    }
    
    
    
    
    
    
    
    
    
    
    
    func createSubscription() {
        
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        
        storageRef.downloadURL { url, _ in
            
            let currentSubscriptionRef = COLLECTION_SUBSCRIPTIONS.document()
            
            let subscriptionID = currentSubscriptionRef.documentID
            print("DEBUG2: subscriptionID -- \(subscriptionID) ")
            let currentUserSubscriptions = COLLECTION_SUBSCRIPTIONS.document(subscriptionID)
            
            
            let data: [String: Any] = [
                
                "name" : self.name,
                "description" :  self.description,
                "subscriptionType" : self.subscriptionType,
                "storeSelected" :self.storeSelected,
                "price" : self.price,
                "yearPrice" : self.yearPrice,
                "onSale" : self.onSale,
                "salePrice" : self.salePrice,
                "icon" : self.icon,
            
                "timestamp" : Timestamp(date: Date()),
                "id" : subscriptionID
                
            ]
            
            
            
            print("DEBUG3: subscriptionID -- \(subscriptionID) ")
            
            // Add subscription to User
            currentUserSubscriptions.setData(data)
            print("DEBUG4: subscriptionID -- \(subscriptionID) ")
            
            print("DEBUG5: currentUserSubscriptions -- \(currentUserSubscriptions) ")
            
            // Add subscription to All Subscriptions
            currentSubscriptionRef.setData(data)
            print("DEBUG6: currentSubscriptionRef -- \(currentSubscriptionRef) ")
            self.fetchSubscriptions() // elimiates bug on need to close app to see changes
        }
        // }
    }
    
    
    
    
    
    func createSubscriptionType(
        subscriptionID : String ,
        
        name : String,
        description :  String,
        subscriptionType : String,
        storeSelected : Bool,
        price : Double,
        yearPrice : Double,
        salePrice : Double,
        onSale : Bool,
        image : String,
        
        icon : String,
        subscriptionSortCount : Int,
        features : [String]
    
    
    
    ) {
      //  getStoreById(storeId: subscriptionID)
        print("DEBUG: subscriptionID \(subscriptionID)")
        
        
        
        let currentSubscriptionTypeRef = COLLECTION_SUBSCRIPTIONS.document(subscriptionID).collection("subscriptionTypes").document()
        
        let allSubscriptionTypesRef = COLLECTION_SUBSCRIPTION_TYPES.document()
        
        let subscriptionTypeID = currentSubscriptionTypeRef.documentID
        
        //        let currentUserSubscriptionTypes = COLLECTION_SUBSCRIPTIONS.document(subscriptionID).COLLECTION_USERS.document(currentUid).collection("subscriptionTypes").document(subscriptionTypeID)
        //
        
        let data: [String: Any] = ["name" : name,
                                   "description" : description,
                                   "subscriptionType" : subscriptionType,
                                   "storeSelected" :storeSelected,
                                   "price" : price,
                                   "yearPrice" : yearPrice,
                                   "salePrice" : salePrice,
                                   "onSale" : onSale,
                                   "image" : image,
                                   "icon" : icon,
                                   "subscriptionSortCount" : subscriptionSortCount,
                                   "features" : features,
                                   
                                   
                                   
                                   "fromId" : subscriptionID,
                                   //    "timestamp" : Timestamp(date: Date()),
                                   "id" : subscriptionTypeID
        ]
        
        // Add subscriptionType to All SubscriptionTypes
        currentSubscriptionTypeRef.setData(data)
        // Add subscriptionType to All SubscriptionTypes
        
        allSubscriptionTypesRef.setData(data)
    }
    
    
    
    
    
  

}
