//
//  UploadProductViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Firebase
// import SPAlert

class UploadProductViewModel: ObservableObject {
    @StateObject var globalVM = GlobalFirebaseViewModel()
    @Binding var isPresented : Bool
    
    // Dismiss view via Binding
    init(isPresented : Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    
    // uoload image to firebase
    func uploadImage(_ referenceString:String, image:UIImage, completion: @escaping (Any) -> Void, showDetails: Bool = false){
        if let imageData = image.jpegData(compressionQuality: 1){
            let storage = Storage.storage()
            storage.reference().child(referenceString).putData(imageData, metadata: nil){
                (strgMtdta, err) in
                
                if let err = err {
                    print("an error has occurred - \(err.localizedDescription)")
                } else {
                    print("image uploaded successfully")
                    
                    
                    
                    completion(true)
                    
                }
            }
        } else {
            print("couldn't unwrap image as data")
        }
        
        
    }
    
//
//
//
//
//    func UploadAndUpdateProduct(_ referenceString:String,
//                                image:UIImage,
//                                docRef : DocumentReference,
//                                id: String,
//                                name : String,
//                                description: String,
//                                isAdded : Bool,
//                                cost : NSNumber,
//                                likes : Int,
//                                taxed: Bool,
//                                variantItem : Bool,
//                                size: [String],
//                                sizePricing :  [String],
//                                sizeQuantity :[String],
//                                onSale: Bool,
//                                onSalePrice : Double, // change to nsNumber
//                                tags : [String],
//                                brand : String,
//                                category : String,
//                                sku : String,
//                                mainColor : String,
//                                want : Bool,
//                                releaseDate : String,
//                                onAppImages: [String],
//                                images: [String],
//                                soldOut : Bool,
//                                active: Bool,
//                                completion: @escaping (Any) -> Void, showDetails: Bool = false){
//
//
//            // Allow only Users to create products
//            guard let user = AuthViewModel.shared.user else { return }
//
//            // create random ID
//        let docRef = COLLECTION_PRODUCTS.document(id)
//
//            // data dictionary
//            let data: [String: Any] = ["name" : name,
//                                       "description": description,
//                                       "isAdded" : isAdded,
//                                       "cost" : cost,
//                                       "likes" : likes,
//                                       "taxed": taxed,
//                                       "variantItem" : variantItem,
//                                       "size": size,
//                                       "sizePricing" :  sizePricing,
//                                       "sizeQuantity" : sizeQuantity,
//                                       "onSale": onSale,
//                                       "onSalePrice" : onSalePrice,
//                                       "tags" : tags,
//                                       "brand" : brand,
//                                       "category" : category,
//                                       "sku" : sku,
//                                       "mainColor" : mainColor,
//                                       "want" : want,
//                                       "releaseDate" : releaseDate,
//                                       "onAppImages": onAppImages,
//                                    //   "images" : [],
//                                       "soldOut" : soldOut,
//                                       "active": active,
//
//                                       "uid" : user.id,
//                                       "fullname" : user.fullname,
//                                       "username" : user.username,
//                                       "profileImageURL" : user.profileImageURL,
//                                       "id" : docRef.documentID,
//                                       "timestamp" : Timestamp(date: Date())
//
//                                    //   "imagesCoverted" : imagesCoverted.count-1,
//
//
//            ]
//
//
//            // upload All Data
//            docRef.setData(data) { _ in
//                print("DEBUG: Uploaded Product... ")
//                // Dismiss Screen
//                self.isPresented = false
//
//
//            }
//
//
//    //        docRef.setData(["images": FieldValue.arrayUnion([images])]) { _ in
//    //
//    //        }
//
//
//
//        
//
//
//
//    }
//
    
    
    
    
    
    
    func uploadProduct(id: String,
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
                       
                     
                       onAppImages: [String],
                       images: [String],
                     
                       soldOut : Bool,
                       active: Bool
                       
                      
    ) {
        // Allow only Users to create products
        guard let user = AuthViewModel.shared.user else { return }
        
        // create random ID
       // let docRef = COLLECTION_PRODUCTS.document(id)
        let docRef = COLLECTION_PRODUCTS.document()
        let userProductRef = COLLECTION_USERS.document(user.id).collection("products").document()
        
        // data dictionary
        let data: [String: Any] = ["name" : name,
                                   "description": description,
                                   "isAdded" : isAdded,
                                   "cost" : cost,
                                   "likes" : likes,
                                   "taxed": taxed,
                                   "variantItem" : variantItem,
                                   "size": size,
                                   "sizePricing" :  sizePricing,
                                   "sizeQuantity" : sizeQuantity,
                                   "quantity" : quantity ,
                                   "onSale": onSale,
                                   "onSalePrice" : onSalePrice,
                                   "tags" : tags,
                                   "brand" : brand,
                                   "category" : category,
                                   "sku" : sku,
                                   "mainColor" : mainColor,
                                   "want" : want,
                                   "releaseDate" : releaseDate,
                                   "onAppImages": onAppImages,
                                //   "images" : [],
                                   "soldOut" : soldOut,
                                   "active": active,

                                   "uid" : user.id,
                                   "fullname" : user.fullname,
                                   "username" : user.username,
                                   "profileImageURL" : user.profileImageURL,
                                   "id" : docRef.documentID,
                                   "timestamp" : Timestamp(date: Date())
                                   
                                //   "imagesCoverted" : imagesCoverted.count-1,

                                   
        ]

        
        // upload to all products
        docRef.setData(data) { _ in
            print("DEBUG: Uploaded Product... ")
            // Dismiss Screen
            self.isPresented = false
            
            
        }
        
        // upload to users products
        userProductRef.setData(data) { _ in
            print("DEBUG: Uploaded Product... ")
            // Dismiss Screen
            self.isPresented = false
            
            
        }
        
        
//        docRef.setData(["images": FieldValue.arrayUnion([images])]) { _ in
//
//        }
    }
    
    
    
    
//    func uploadProduct20(
//        docRef : DocumentReference,
//        id: String,
//        name: String,
//        description: String,
//        price : Double,
//        likes : Int,
//        taxed: Bool,
//        singleItemPrice: Double,
//        onSale: Bool,
//        onSalePrice : Double,
//        //   image : UIImage,
//        images : [String],
//        tags : [String],
//        brand : String,
//        category : String,
//        sku : String,
//        mainColor : String,
//
//        active: Bool
//
//
//    ) {
//
//        // current iser
//        guard let user = AuthViewModel.shared.user else { return }
//
//
//        // create random ID
//        //let docRef = COLLECTION_PRODUCTS.document()
//
//
//
//        // data dictionary
//        let data: [String: Any] = [ "name": name,
//                                    "description": description,
//                                    "price" : price,
//                                    "likes" : likes,
//                                    "taxed": taxed,
//                                    "singleItemPrice": singleItemPrice,
//                                    "onSale": onSale,
//                                    "onSalePrice" : onSalePrice,
//                                    "images" : images.count-1,
//                                    "tags" : tags,
//                                    "brand" : brand,
//                                    "category" : category,
//                                    "sku" : sku,
//                                    "mainColor" : mainColor,
//
//                                    "active": active,
//
//                                    "uid" : user.id,
//                                    "fullname" : user.fullname,
//                                    "timestamp" : Timestamp(date: Date()),
//                                    "username" : user.username,
//                                    "profileImageURL" : user.profileImageURL,
//                                    "docRef" : docRef,
//                                    "id" : docRef.documentID
//        ]
//        // upload it to our tweet collection
//        docRef.setData(data) { _ in
//            print("DEBUG: Uploaded Product... ")
//            // Dismiss Screen
//            self.isPresented = false
//
//        }
//
//
//
//        func submitRecipe() {
//
//            //let actionsToComplete = 2 + images.count
//            //  var actionsCompleted = 0
//
//            func check_success(){
//                //  print("\(actionsCompleted)/\(actionsToComplete)")
//                //   if actionsCompleted == actionsToComplete {
//
//                let alertView = SPAlertView(title: "Recipe Submitted", message: "Recipe submitted successfully!", preset: SPAlertIconPreset.done)
//                //  alertView.duration = 3
//                alertView.present()
//
//                guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
//                // newRecipePost.postingUser = currentUid // ( already set above )
//
//                let userRef = COLLECTION_USERS.document(currentUid)
//
//                if var user = AuthViewModel.shared.user {
//
//
//                    user.publishedProducts.append(docRef.documentID)
//
//
//                    userRef.updateData([ "publishedProducts": FieldValue.arrayUnion([ "\(docRef.documentID)"])]) { _ in
//
//                    }
//                }
//            }
//        }
//    }
    
}

