//
//  OrderViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/23/21.
//


import SwiftUI
import Firebase

class OrderViewModel : ObservableObject {
    @Published var orders = [Order]()
    @Published var user: User?
 //   @Published var carts = [Cart]()
  //  @Published var items : [Cart] = []
    
    
    var id: String?
    var customerId: String = ""
    var orderItems: [Product] = []
    var amount: Double = 0.0
    var total: Double = 0.0
    
    var customerName: String = ""
    var isCompleted: Bool = false
    
    
    init() {
        fetchOrders()
    }
    //
    // list of all tweets
    func fetchOrders() {
        COLLECTION_ORDERS
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.orders = documents.map({ Order(dictionary: $0.data())})
            }
    }
    
    
    
    func createOrder(
        username : String,
        fullname : String,
        profileImageURL : String,
        address : String,
        city : String,
        state : String,
        zip : String,
        phoneNumber : String ,
        email : String,
        subtotal : String ,
        shipping: Float ,
        estimatedTax : String ,
        total : String
    ) {
        
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        
        let currentOrderRef = COLLECTION_ORDERS.document()
        let orderID = currentOrderRef.documentID
        let currentUserOrders = COLLECTION_ORDERS.document(orderID)
        
        
        let data: [String: Any] = [
            
            "username":  username,
            "fullname" : fullname,
            "customerId" :  currentUid,
            "profileImageURL"  : profileImageURL,
            "amount" :self.amount,
           
            "isCompleted" : self.isCompleted,
            
            // address
           "address" : address,
            "city" : city,
            "state" : state,
            "zip" : zip,
            
            // contact
            "phoneNumber" : phoneNumber,
            "email" : email,
           
            // Pricing
            "subtotal" : subtotal,
            "Shipping" : shipping,
            "estimatedTax" : estimatedTax,
            "total" : total,
            
            
            "timestamp" : Timestamp(date: Date()),
            "id" : orderID
            
        ]
        
        currentUserOrders.setData(data)
        currentOrderRef.setData(data)
        self.fetchOrders() // elimiates bug on need to close app to see changes
    }
}


