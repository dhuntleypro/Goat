//
//  SubscriptionTypeViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//



import SwiftUI
import Firebase // may not need
import FirebaseAuth
import CryptoKit

class SubscriptionTypeViewModel : ObservableObject {
    @Published var subscriptionTypes = [SubscriptionType]()
    
    
    init() {

        fetchSubscriptionTypes()
    }

    func fetchSubscriptionTypes() {
        COLLECTION_SUBSCRIPTION_TYPES
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.subscriptionTypes = documents.map({ SubscriptionType(dictionary: $0.data() )})
            }
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
        
      let currentSubscriptionTypeRef = COLLECTION_SUBSCRIPTIONS.document().collection("subscriptionTypes").document()
        
        let allSubscriptionTypesRef = COLLECTION_SUBSCRIPTION_TYPES.document()
        
        let subscriptionTypeID = currentSubscriptionTypeRef.documentID
        
  
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
     //   currentSubscriptionTypeRef.setData(data)
        // Add subscriptionType to All SubscriptionTypes
        
        allSubscriptionTypesRef.setData(data)
    }
    
    
    
    
}
