//
//  Constants.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI
import Firebase

// Lazy Grid
let columns = [
 
    GridItem(.flexible(), spacing: 0),
    GridItem(.flexible(), spacing: 0)

]

// Brand Name
let BRAND_NAME = "GOAT"


let COLLECTION_USERS = Firestore.firestore().collection("users")
 let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
 let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")

