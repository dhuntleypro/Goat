//
//  ProductViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Firebase

class ProductViewModel : ObservableObject {
    @Published var products = [Product]()
    
    
    @Published var cartProducts : [Cart] = []
   
    @Published var items : [Product] = []

    
    
    init() {
        fetchProducts()
      // print("DEBUG: LOADING DATA")
    }
    
    // list of all products
    func fetchProducts() {
        COLLECTION_PRODUCTS
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.products = documents.map({ Product(dictionary: $0.data())})
           //   self.productSizes = documents.map({ ProductSize(dictionary: $0.data())})

            
            }
    }
    
    
    
    

    
    func getIndex(product: Product , isCartIndex: Bool)->Int{
        let index = self.products.firstIndex{ (item1) -> Bool in
            return product.id == item1.id
        } ?? 0
        
        let cartIndex = self.cartProducts.firstIndex{ (item1) -> Bool in
            return product.id == item1.id
        } ?? 0
        
        return isCartIndex ? cartIndex : index
    }
    
//    func calculateTotalPrice()->String {
//        var price : Float = 0
//        
//        cartProducts.forEach { item in
//            price += Float(item.quanity) *  6 // items.cost
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
////
    
    
    func updateProduct(
        id: String,
        name : String,
        description: String,
        isAdded : Bool,
      //  cost : Float,
        cost : String,
        likes : String,
        taxed: Bool,
        variantItem : Bool,
        size: [String],
        sizePricing :  [Float],
        sizeQuantity :[Int],
        quantity : String,
        onSale: Bool,
        onSalePrice : String, // change to nsNumber
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
        
        let currentUserRef = COLLECTION_USERS.document(currentUid).collection("products").document(id)
        let productRef = COLLECTION_PRODUCTS.document(id)

                
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

        productRef.setData(data, merge : true)
        
           
        
    }
    
   
    
    
//    func createTag( id: String, tag : [String] ) {
//        // get current user
//     //   guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
//        
//     //  let currentUserRef = COLLECTION_USERS.document(currentUid).collection("products").document(id)
//        let productRef = COLLECTION_PRODUCTS.document(id)
//    
//        
//        let data = [ "tags" : tag ] as [String : Any]
//        
//        
//        // Action
//       // currentUserRef.setData(data, merge : true)
//      //  productRef.setData(data, merge : true)
//       // currentUserRef.updateData(data)
//
//        print("DEBUG: yooooooo")
//        
//        productRef.updateData(data)
//        
//    }
    
    func updateTags( id: String, tag : String ) {
        
        
        
        
      //  productVM.products.append(Product(dictionary: ["tags" : ""]))
    }
    
    
   
    
    
    
    
}
