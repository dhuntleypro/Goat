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

class SubscriptionViewModel : ObservableObject {
    @Published var subscriptions = [Subscription]()
    
    
    init() {

        fetchSubscriptions()
    }

    func fetchSubscriptions() {
        COLLECTION_SUBSCRIPTIONS
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.subscriptions = documents.map({ Subscription(dictionary: $0.data())})
            }
    }
    
    
    
    func createSubscription(
        subscriptionID : String ,
        name : String,
        description :  String,
        subscriptionType : String,
        image : String,
        
        icon : String,
        subscriptionSortCount : Int
        
    
    
    
    ) {
       // getStoreById(storeId: subscriptionID)
        
        
        
        let currentSubscriptionTypeRef = COLLECTION_SUBSCRIPTIONS.document(subscriptionID).collection("subscriptionTypes").document()
        
        let allSubscriptionTypesRef = COLLECTION_SUBSCRIPTION_TYPES.document()
        
        let subscriptionTypeID = currentSubscriptionTypeRef.documentID
        
  
        let data: [String: Any] = ["name" : name,
                                   "description" : description,
                                   "subscriptionType" : subscriptionType,
                                 
                                   "image" : image,
                                   "icon" : icon,
                                   "subscriptionSortCount" : subscriptionSortCount,
                                   
                                   
                                   
                                   
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
