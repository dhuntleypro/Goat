//
//  CollectionViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Firebase

class CollectionViewModel : ObservableObject {
    @Published var collections = [Collection]()
    
    init() {
        fetchCollections()
      //  print("DEBUG: LOADING DATA")

    }
    
    // list of all collections
    func fetchCollections() {
        COLLECTION_PRODUCT_COLLECTIONS
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                self.collections = documents.map({ Collection(dictionary: $0.data())})
            }
    }
    
    
    func updateCollection(
        id: String,
        title : String,
        caption : String,
        description: String,
        amount : String,
        likes : Int,
        onSale: Bool,
        
        images : [String],
        
        sequenceCount : Int,
        conditions : [String],
       // pickImage : UIImage,
        active: Bool
        
        
      
      //  uid : String
        
    ) {
        
        // get current user
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        let currentUserRef = COLLECTION_USERS.document(currentUid).collection("productCollections").document(id)
        let collectionRef = COLLECTION_PRODUCT_COLLECTIONS.document(id)
        
                
                print("DEBUG01: currentUid -- \(currentUid) ")
                
                let data = [
                   
                    "title" : title,
                    "caption" : caption,
                    "description": description,
                    "amount" : amount,
                    "likes" : likes,
                    "onSale": onSale,
            //        "image" : image,
                    "images" : images,
                  //  "imagesURL" : imagesURL,
                    "sequenceCount" : sequenceCount,
                    "conditions" : conditions,
                 //   "pickImage" : pickImage,
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

        collectionRef.setData(data, merge : true)
        
           
        
    }
    
    
    
    
    
    func addImage(profileImage: UIImage) {
        
        // UPLOAD THE IMAGE UOLOADED BY NEW USER
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Fail tp upload image \(error.localizedDescription)")
            }
            
            
            storageRef.downloadURL { url, _ in
                guard let profileImageURL = url?.absoluteString else { return }
                
                
                // CREATE AUTHENTICATE NEW USER
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return // if error - print error and stop
                    }
                    
                    print("DEBUG: Successfully signup user...")
                    
                    // CHECK IF USER EXIST
                guard let currenUid = Auth.auth().currentUser?.uid else { return }

                    // ADD TO COLLECTION IN CLOUD FIREBASE
                    let data = ["profileImageURL" : profileImageURL,
                                "uid" : currenUid
                    ]
                    // FETCH THE USER
                    COLLECTION_PRODUCT_COLLECTIONS
                        .document(currenUid)
                        .setData(data) { _ in
                          //  self.userSession = user
                           self.fetchCollections() // elimiates bug on need to close app to see changes
                            print("DEBUG: Successfully uploaded user data to cloud firebase")
                        }
            
            }
        }
    }
}
