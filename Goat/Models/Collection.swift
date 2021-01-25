//
//  Collection.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct Collection: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    let conditions: [String]
    let isCurrentUser: Bool
}

// Data source

let MOCK_COLLECTION: [Collection] = [
    .init(id: 0,
          name: "Just Dropped",
          description: "Check out the latest launches and new releases. Sneakers from Nike, Jordan, adidas, Vans, New Balance and more available now.",
          image: "collection-bg-1",
          price: 110.0,
          conditions: ["Just Dropped"],
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "Most Popular",
          description: "Be in the know and grab what's in style right now",
          image: "collection-bg-2",
          price: 110.0,
          conditions: ["Most Popular" ],
          isCurrentUser: false
    ),
    
    .init(id: 2,
          name: "Our Favorites",
          description: "We love all of our product but if your looking for our absolute favorite, check these out",
          image: "collection-bg-3",
          price: 320.0,
          conditions: ["Our Favorites" , "our favorites"],
          isCurrentUser: false
    ),
    
    .init(id: 3,
          name: "Winter 2021",
          description: "Winter is here and it's getting cold out so ckeck these out",
          image: "collection-bg-4",
          price: 220.0,
          conditions: ["Winter 2021"],
          isCurrentUser: false
    ),
    
    .init(id: 4,
          name: "2020",
          description: "Its the end of the world and you can choose as many as you want",
          image: "collection-bg-5",
          price: 310.0,
          conditions: ["2020"],
          isCurrentUser: false
    ),
]
