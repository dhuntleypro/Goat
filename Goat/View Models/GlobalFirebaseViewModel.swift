//
//  GlobalFirebaseViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Firebase

class GlobalFirebaseViewModel : ObservableObject {
//    @Published var products = [Product]()
//
//    init() {
//      fetchProducts()
//    }
//
//    // list of all products
//
//    func fetchProducts() {
//        COLLECTION_PRODUCTS
//            .getDocuments { snapshot, _ in
//                guard let documents = snapshot?.documents else { return }
//                self.products = documents.map({ Product(dictionary: $0.data())})
//            }
//    }
//
  
    
//    func collectionCount(amount: Int) {
//        COLLECTION_PRODUCT_COLLECTIONS.getDocuments()
//        {
//            (querySnapshot, err) in
//
//            if let err = err
//            {
//                print("Error getting documents: \(err)");
//            }
//            else
//            {
//                var count = 0
//                for document in querySnapshot!.documents {
//                    count += 1
//                    print("\(document.documentID) => \(document.data())");
//                }
//                amount == count
//                print("Count = \(amount)");
//            }
//        }
//    }
//
    
    
    
    func firestoreSubmit_data(docRef_string:String, dataToSave:[String:Any], completion: @escaping (Any) -> Void, showDetails: Bool = false){
        
        let docRef = Firestore.firestore().document(docRef_string)
        print("setting data")
        docRef.setData(dataToSave){ (error) in
            if let error = error {
                print("error = \(error)")
            } else {
                print("data uploaded successfully")
                if showDetails {
                    print("dataUploaded = \(dataToSave)")
                }
                completion(true)

            }
        }
    }
    
   
    
    
    
    // upload image to firebase
    func uploadImage(_ referenceString:String, image:UIImage, docRef : DocumentReference,completion: @escaping (Any) -> Void, showDetails: Bool = false){
       
        if let imageData = image.jpegData(compressionQuality: 1){
            let storage = Storage.storage()
            storage.reference().child(referenceString).putData(imageData, metadata: nil){
                (strgMtdta, err) in
                
                
                
                if let err = err {
                    print("an error has occurred - \(err.localizedDescription)")
                } else {
                    
                    storage.reference().child(referenceString).downloadURL { url, _ in
                        guard let imageURL = url?.absoluteString else { return }
                        
                     //   let data = ["images" : imageURL]
                        print("DEBUGGING: ImageURL: ==> \([imageURL])")

//                        docRef.setData(["images": FieldValue.arrayUnion([imageURL])], merge: true) { _ in
//                        }

                        
//                        COLLECTION_PRODUCTS.document(docRef.documentID).updateData(["images": FieldValue.arrayUnion([imageURL])]) { _ in
//                        }
                        
                     COLLECTION_PRODUCTS.document(docRef.documentID).setData(["images": FieldValue.arrayUnion([imageURL])], merge: true) { _ in
                     }
                        
                    }
                    print("image uploaded successfully")
                    completion(true)

                }
            }
        } else {
            print("couldn't unwrap image as data")
        }
        
        
    }

    
    
//    func uploadSize(_ referenceString:String, size : [ProductSize] , name: String, amount: Double, amountUnit : ProductSizeUnit, docRef : DocumentReference,completion: @escaping (Any) -> Void, showDetails: Bool = false) {
//
//       // docRef.updateData(["sizes": FieldValue.arrayUnion(size.formatForFirebase())]) { _ in
////        docRef.updateData(["sizes": ProductSize( name: name, amount: amount, amountUnit: amountUnit) ]) { _ in
////
////          }
//
//        docRef.updateData(["sizeName": name]) { _ in
//
//          }
//
//      docRef.updateData(["sizeAmount": amount]) { _ in
//
//        }
//
//        docRef.updateData(["sizeAmountUnit": amountUnit.rawValue ]) { _ in
//
//          }
//    }
//
//
//
    
    
    
    
 
    


    
}
