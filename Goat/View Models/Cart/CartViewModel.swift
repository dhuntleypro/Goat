//
//  CartViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/1/21.
//


import SwiftUI
import Firebase

class CartViewModel : ObservableObject {
    @Published var carts = [Cart]()
    @Published var items : [Cart] = []

    
    
    init() {
       fetchUserCart()
        //    fetchAbandonedCart()
    }
    


    
    func fetchUserCart() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_USERS.document(currentUid).collection("cart")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
             //   self.carts = documents.map({ Cart(dictionary: $0.data())})
                self.items = documents.map({ Cart(dictionary: $0.data())})

            }
    }
    

    
    func addToCart(product: Product, selectedSize: String, selectedSizePrice: Float  , quantity : Int , offset: CGFloat , isSwiped : Bool, total : Float) {
        
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
      //  guard let user = AuthViewModel.shared.user else { return }
        
        let AbandonedCartRef = COLLECTION_ABANDONED_CART.document()
        
        let UserProductRef = COLLECTION_USERS.document(currentUid).collection("cart").document()
        
            
        let data: [String: Any] = ["name" : product.name,
                                   "images" : product.images,
                                   "demoImage" : product.onAppImages,
                                   "quantity" : quantity,
                                   "size" : selectedSize,
                                   "cost" :  selectedSizePrice * Float(quantity),
                                   "offset" : 0 ,
                                    "isSwiped" : false,
                                   "id": product.id,
                                   "Cart Owner" :  currentUid // user.id
                                  ]
        
       // COLLECTION_USERS.document(user?.id).setData(["cart": ["uhuh"]] , merge: true)
        UserProductRef.setData(data, merge: true)
        AbandonedCartRef.setData(data, merge: true)


       
        
        print("ITEM ADDED TO CART")
    }
    
    
    
    func updateProductCartQuantity(id: String, quantity : String) {
        // get current user
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        let currentUserRef = COLLECTION_USERS.document(currentUid).collection("cart").document(id)
       // let productRef = COLLECTION_PRODUCTS.document(id)

        let data = [ "quantity" : quantity ]  as [String : Any]
        
        //currentUserRef.setData([data], merge: true)
        
        currentUserRef.updateData(data)
    }


    
    // list of all carts
    func fetchAbandonedCart() {
    
        COLLECTION_ABANDONED_CART
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.items = documents.map({ Cart(dictionary: $0.data())})
             //   self.cartSizes = documents.map({ CartSize(dictionary: $0.data())})

            }
    }
    
    
    


    
    func getIndex(cart: Cart , isCartIndex: Bool)->Int{
        let index = self.items.firstIndex{ (item1) -> Bool in
            return cart.id == item1.id
        } ?? 0
        
        let cartIndex = self.items.firstIndex{ (item1) -> Bool in
            return cart.id == item1.id
        } ?? 0
        
        return isCartIndex ? cartIndex : index
    }
    
//    func calculateTotalPrice()->String {
//        var price : Float = 0
//        
//        cartProducts.forEach { item in
//            price += Float(items) *  6 // items.cost
//            
//        }
//        return getPrice(value: price)
//    }
//
//    func getPrice(value: Float) -> String {
//        let format = NumberFormatter()
//        format.numberStyle = .currency
//
//        return format.string(from: NSNumber(value: value)) ?? ""
//    }
//
    
    func updateProduct(
        id: String,
        name : String,
        description: String,
        isAdded : Bool,
        cost : Float,
        likes : Int,
        taxed: Bool,
        variantItem : Bool,
        size: [String],
        sizePricing :  [Float],
        sizeQuantity :[Int],
        quantity : Int,
        onSale: Bool,
        onSalePrice : Float, // change to nsNumber
        tags : [String],
        brand : String,
        category : String,
        sku : String,
        mainColor : String,
        want : Bool,
        releaseDate : String,
        images : [String],
        onAppImages: [String],
        soldOut : Bool,
        active: Bool
        
    ) {
        
        // get current user
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        let currentUserRef = COLLECTION_USERS.document(currentUid).collection("carts").document(id)
        let cartRef = COLLECTION_PRODUCTS.document(id)

                
                print("DEBUG01: currentUid -- \(currentUid) ")
                
                let data = [
                   
                    
                     "name": name,
                    "description": description,
                    "isAdded" : isAdded,
                    "cost" : cost,
                    "likes" : likes,
                    "taxed": taxed,
                    "variantItem" : variantItem,
                    "size": size,
                    "sizePricing":  sizePricing,
                    "sizeQuantity" : sizeQuantity,
                    "quantity" : quantity,
                    "onSale": onSale,
                    "onSalePrice" : onSalePrice, // change to nsNumber
                    "tags" : tags,
                    "brand" : brand,
                    "category" : category,
                    "sku" : sku,
                    "mainColor" : mainColor,
                    "want" : want,
                    "releaseDate" : releaseDate,
                    "images" : images,
                    //  "images" : images.count-1,
                    "onAppImages": onAppImages,
                    "soldOut" : soldOut,
                    "active": active,
                    
                    "id": id,
                    
 //                    "username": username,
 //                    "profileImageURL": profileImageURL,
 //                    "fullname": fullname,
                     "uid" : currentUid,
                     
                    
                     "timestamp" : Timestamp(date: Date())
                    
                ] as [String : Any]
                
                
              
              // (tip) - with merge it doesn't remove missing data from above from firebase
        currentUserRef.setData(data, merge : true)

        cartRef.setData(data, merge : true)
        
           
        
    }
    
    
    
    
    
    
}
