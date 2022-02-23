//
//  UploadCollectionViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Firebase
// import SPAlert

class UploadCollectionViewModel: ObservableObject {
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

    
    
    
    func uploadCollection(
        id: String,
        title: String,
        caption: String,
        description: String,
        amount: Int,
        likes : Int,
        onSale: Bool,
        image : String,
        images : [String],
        sequenceCount : Int,
        conditions : [String],
        active: Bool
        


    
    
    ) {
        print("DEBUG: YOOO")
        // current iser
        guard let user = AuthViewModel.shared.user else { return }
        print("DEBUG: YOOO2")

        // create random ID
        let docRef = COLLECTION_PRODUCT_COLLECTIONS.document()
        
   
        
        
        
        // data dictionary
        let data: [String: Any] = [ "title": title,
                                    "caption" : caption,
                                    "description": description,
                                    "amount" : amount,
                                    "likes" : likes,
                                   "onSale": onSale,
                                   "image" : image,
                                    "images" : images.count-1,
                                    "sequenceCount" : sequenceCount,
                                    "conditions" : conditions,
                                    "active": active,
                                    
                                    
                                    "uid" : user.id,
                                    "fullname" : user.fullname,
                                    "timestamp" : Timestamp(date: Date()),
                                    "username" : user.username,
                                    "profileImageURL" : user.profileImageURL,
                                    "docRef" : docRef,
                                    "id" : docRef.documentID
                                ]
        // upload it to our tweet collection
        docRef.setData(data) { _ in
            print("DEBUG: Uploaded Collection... ")
            // Dismiss Screen
            self.isPresented = false
        }
        
        
        
        func submitRecipe() {
            
            //let actionsToComplete = 2 + images.count
          //  var actionsCompleted = 0
            
            func check_success(){
              //  print("\(actionsCompleted)/\(actionsToComplete)")
             //   if actionsCompleted == actionsToComplete {
                    
                //    let alertView = SPAlertView(title: "Recipe Submitted", message: "Recipe submitted successfully!", preset: SPAlertIconPreset.done)
                    //  alertView.duration = 3
                //    alertView.present()
                    
                    // clear all the data on this page
                  //  self.clearPage()
                    
                    // close sheet
               //     self.show_reviewSheet = false
             //   }
            }
           // if images.count > 0 {
               
                guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
                // newRecipePost.postingUser = currentUid // ( already set above )
                
                let userRef = COLLECTION_USERS.document(currentUid)
                
                if var user = AuthViewModel.shared.user {
                    
                    // data
                    //                let thisRecipePost = RecipePost(title: self.newRecipePost.title,
                    //                                                steps: self.newRecipePost.steps,
                    //                                                ingredients: self.newRecipePost.ingredients,
                    //                                                postingUser: currentUid,
                    //                                                description: "",
                    //                                                numberOfLikes: 0,
                    //                                                image: Image(uiImage: self.images[0].image)
                    //
                    //                )
                  //  let thisRecipePost = newRecipePost
                    
                   // print("DEBUG: thisRecipePost -- \(thisRecipePost)")
                    
                    // update thisRecipePost.id
                    user.publishedCollections.append(docRef.documentID)
                    
                    
                    // save thisRecipePost to ....
//                    globalVM.firestoreSubmit_data(docRef_string: "recipe/\(docRef.documentID)", dataToSave: thisRecipePost.dictionary, completion: {_ in
//
//                        actionsCompleted += 1
//                        check_success()
//
//                    })
                    
                    // Atomically add a new recipe id to the "publushed collections" array field.
                    userRef.updateData([ "publishedCollections": FieldValue.arrayUnion([ "\(docRef.documentID)"])]) { _ in
                        
                    //    actionsCompleted += 1
                    //    check_success()
                    }
                    
                    
                    
//                    // upload images
//                    for i in 0...images.count-1 {
//                        let image = images[i].image
//                        uploadImage("recipe_\(docRef.documentID)_\(i)", image: image, completion: {_ in
//                            actionsCompleted += 1
//                            check_success()
//
//                        })
//                    }
//
           //     }
                
                
                
          //  } else {
//                let alertView = SPAlertView(title: "Add a photo", message: "You cannot submit a recipe without a photo", preset: SPAlertIconPreset.error)
//                //   alertView.duration = 3
//                alertView.present()
//
//            }
//
                }
        }
    }
}


