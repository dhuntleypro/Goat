//
//  ProfileViewModel.swift
//  Goat
//
//  Created by Darrien Huntley on 1/27/21.
//


import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var isFollowed = false
    
    func follow(uid: String) {
        guard let currenUid = Auth.auth().currentUser?.uid else { return }
//        Firestore.firestore()
//            .collection("users")
        COLLECTION_FOLLOWING
            .document(currenUid)
            .collection("user-following")
            .document(uid)
            .setData([:]) { _ in
                COLLECTION_FOLLOWERS
                    .document(uid)
                    .collection("user-followers")
                    .document(uid)
                    .setData([:]) { _ in
                        self.isFollowed = true
                    }
            }
    }
    
    func unfollow() {
        
    }
    
    
    
    
}
