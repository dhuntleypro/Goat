//
//  SearchViewModel.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    // MODEL
    @Published var users = [User]()
    @Published var products = [Product]()
    @Published var collections = [Collection]()
  //  @Published var stores = [Store]()
    
  //  @Published var store: StoreViewModel?

   //store @State var storeId = storeId
    init() {
        fetchUser()
    //    fetchAllStores()
        fetchAllProducts()
        fetchAllCollections()

    }

    
    func fetchUser() {
//        Firestore.firestore()
//            .collection("users")
        COLLECTION_USERS
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            // CREATE A USER FOR EACH DOCUMENT
            self.users = documents.map({ User(dictionary: $0.data()) })
            
            
        }
    }
    
//    func fetchAllStores() {

//        COLLECTION_STORES
//            .getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            // CREATE A PRODUCT FOR EACH DOCUMENT
//            self.stores = documents.map({ Store(dictionary: $0.data()) })
//
//
//        }
//    }
//
    
    func fetchAllProducts() {

      //  COLLECTION_ALL_PRODUCTS
        COLLECTION_PRODUCTS
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            // CREATE A PRODUCT FOR EACH DOCUMENT
            self.products = documents.map({ Product(dictionary: $0.data()) })


        }
    }


    
    func fetchAllCollections() {

      //  getStoreById(storeId: storeID)

      //  COLLECTION_USERS.collection(currentuid).document().collection("stores").document(storeId).collection("productCollections")
        
        COLLECTION_ALL_PRODUCTS_COLLECTIONS
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            // CREATE A PRODUCT FOR EACH DOCUMENT
            self.collections = documents.map({ Collection(dictionary: $0.data()) })


        }
    }

// STORE ID
//
//    func FireGetStoreById(storeId: String, completion: @escaping (Result<Store?, Error>) -> Void) {
//        let ref = COLLECTION_STORES.document(storeId)
//
//        ref.getDocument { [self] (snapshot, error) in
//
//            if let error = error {
//                completion(.failure(error))
//            } else {
//
//                if let snapshot = snapshot {
//
//                    store?.id = snapshot.documentID
//
//                }
//            }
//        }
//    }
//

    
//    func getStoreById(storeId: String) {
//        FireGetStoreById(storeId: storeId) { result in
//            switch result {
//                case .success(let store):
//                    if store != nil {
//                        DispatchQueue.main.async {
//                            self.store = StoreViewModel()
//                        }
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//            }
//        }
//    }
//
    

    // USER
    func filterUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery) })
    }
    
    
//    func filterStores(_ query: String) -> [Store] {
//        let lowercasedQuery = query.lowercased()
//        return stores.filter({
//
//            $0.storeName.lowercased().contains(lowercasedQuery)
//
//        })
//    }
//
    
    
    
    func filterProducts(_ query: String) -> [Product] {
        let lowercasedQuery = query.lowercased()
        return products.filter({
            
            $0.name.lowercased().contains(lowercasedQuery) ||
            $0.description.lowercased().contains(lowercasedQuery)
            
        })
    }
    
    func filterCollections(_ query: String) -> [Collection] {
        let lowercasedQuery = query.lowercased()
        return collections.filter({
            
            $0.title.lowercased().contains(lowercasedQuery) ||
            $0.caption.lowercased().contains(lowercasedQuery)
            
        })
    }
    
    
    
    
}

