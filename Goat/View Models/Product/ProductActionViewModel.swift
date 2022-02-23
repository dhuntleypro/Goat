//
//  ProductActionViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

class ProductActionViewModel: ObservableObject {
    @Published var user: User? // keep track of the user - Help load user data (going to use our own)
    @Published var products = [Product]()
    @Published var cartProducts : [Cart] = []

    
    let product : Product
    
    @Published var didLike = false
    @Published var didwant = false

    init(product: Product) {
        self.product = product
        checkIfUserLikedProduct()
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
    
    
    
    func addTag( id: String, tag : [String] ) {
       
       
        COLLECTION_PRODUCTS.document(product.id).updateData(["tags" : tag ])

        
    }
    
    
     
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    func calculateTotalPrice()->String {
//        var price : Float = 0
//
//        cartProducts.forEach { item in
//            price += Float(item.quanity) * Float(truncating: product.cost)
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
//    func addToCart(product: Product) {
//        
//        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
//        guard let user = AuthViewModel.shared.user else { return }
//        
//        let cartRef = COLLECTION_CARTS.document()
//        
//        let UserProductRef = COLLECTION_USERS.document(currentUid).collection("cart").document()
//        
//            
//        let data: [String: Any] = ["name" : product.name,
//                                   "images" : product.images,
//                                   "quantity" : product.sizeQuantity,
//                                   "size" : product.size,
//                                   "cost" : product.cost,
//                                   
//                                   "id": product.id,
//                                   "Cart Owner" : user.id
//                                  ]
//        
//       // COLLECTION_USERS.document(user?.id).setData(["cart": ["uhuh"]] , merge: true)
//        UserProductRef.setData(data, merge: true)
//        cartRef.setData(data, merge: true)
//        
//        print("ITEM ADDED TO CART")
//    }
//    
//    
//    func addToCart(product: Product) {
//        // check if its added to cart
//        self.products[getIndex(product: product, isCartIndex: false)].isAdded = !product.isAdded
//        
//        // update search bar
////        self.filter[getIndex(product: product, isCartIndex: false)].isAdded = !product.isAdded
////
////
//        if product.isAdded {
//            // remove from list
//            self.cartProducts.remove(at: getIndex(product: product, isCartIndex: true))
//            return
//        }
//        // else adding
//        self.cartProducts.append(Cart(dictionary: [
//            "product" : product,
//            "quantity" : 1
//        
//        ]))
//        
//    }
    
    
    
    
    
    
    
//
//
//
//
//
//    // WORKS
//    func addProductToCart() {
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
//        print("through guard")
//     //   let productLikesRef = COLLECTION_PRODUCTS.document(product.id).collection("cart")
//     //   let userLikesRef = COLLECTION_USERS.document(uid).collection("user-cart")
//        let userCart = COLLECTION_USERS.document(uid).collection("cart").document()
//       //  let userCartProduct = COLLECTION_USERS.document(uid).collection("cart").document()
//
//        // Add likes
//
//        let data = [
//            "id" : product.id,
//            "name" : product.name,
//            "quantity" : 1,
//            "price" : product.price
//
//
//        ] as [String : Any]
////
////        if product.id {
////
////        }
//        // CHECK IDF ALERSY EXOTS
//      //  COLLECTION_USERS.document(uid).collection("cart").get()
//
//
//
//        COLLECTION_CARTS.document(product.id).updateData(["quanity" : (product.quantity + 1) ])
//
//
//        userCart.setData(data)
//
//    }
//
//
//    func removeProductToCart() {
//        // get user
//        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
//        // set product-likes
//        let productLikesRef = COLLECTION_PRODUCTS.document(product.id).collection("product-wants")
//        // set user-likes
//        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-wants")
//
//        // delete likes
//        COLLECTION_PRODUCTS.document(product.id).updateData(["want" : product.want ]) { _ in
//            productLikesRef.document(uid).delete { _ in
//                userLikesRef.document(self.product.id).delete { _ in
//                    self.didwant = false
//                }
//            }
//        }
//
//    }
    
    
    
   // COLLECTION_PRODUCTS.document(product.id).updateData(["quanity" : (product.quantity + 1) ])

    
    
    
    
    
    
    func wantProduct() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let productLikesRef = COLLECTION_PRODUCTS.document(product.id).collection("product-wants")
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-wants")
        
        // Add likes
        COLLECTION_PRODUCTS.document(product.id).updateData(["want" : product.want ]) { _ in
            productLikesRef.document(uid).setData([:]) { _ in
                userLikesRef.document(self.product.id).setData([:]) { _ in
                    self.didwant = true
                }
            }
        }
    }
    
    
    func unWantProduct() {
        // get user
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        // set product-likes
        let productLikesRef = COLLECTION_PRODUCTS.document(product.id).collection("product-wants")
        // set user-likes
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-wants")
        
        // delete likes
        COLLECTION_PRODUCTS.document(product.id).updateData(["want" : product.want ]) { _ in
            productLikesRef.document(uid).delete { _ in
                userLikesRef.document(self.product.id).delete { _ in
                    self.didwant = false
                }
            }
        }
        
    }
    
    
    
    
    func likeProduct() {
        // get user
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        // set product-likes
        let productLikesRef = COLLECTION_PRODUCTS.document(product.id).collection("product-likes")
        // set user-likes
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        
        // Add likes
        COLLECTION_PRODUCTS.document(product.id).updateData(["likes" : product.likes + 1]) { _ in
            productLikesRef.document(uid).setData([:]) { _ in
                userLikesRef.document(self.product.id).setData([:]) { _ in
                    self.didLike = true
                }
            }
        }
    }
    
    func unlikeProduct() {
        // get user
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        // set product-likes
        let productLikesRef = COLLECTION_PRODUCTS.document(product.id).collection("product-likes")
        // set user-likes
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes")
        
        // delete likes
        COLLECTION_PRODUCTS.document(product.id).updateData(["likes" : product.likes - 1]) { _ in
            productLikesRef.document(uid).delete { _ in
                userLikesRef.document(self.product.id).delete { _ in
                    self.didLike = false
                }
            }
        }
        
    }
    
    func checkIfUserLikedProduct() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let userLikesRef = COLLECTION_USERS.document(uid).collection("user-likes").document(product.id)
        
        userLikesRef.getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.didLike = didLike
        }
    }
}
