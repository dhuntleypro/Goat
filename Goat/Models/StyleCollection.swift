//
//  StyleCollection.swift
//  Goat
//
//  Created by Darrien Huntley on 1/25/21.
//

import SwiftUI

struct StyleCollection: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    let conditions: [String]
    
    
    //style
    let title: String
    let caption: String
    let modelName: String
    let modelImage: String // for style view
    
    let isCurrentUser: Bool
}

// Data source

let MOCK_STYLE_COLLECTION: [StyleCollection] = [
    .init(id: 0,
          name: "Just Dropped",
          description: "Check out the latest launches and new releases. Sneakers from Nike, Jordan, adidas, Vans, New Balance and more available now.",
          image: "collection-bg-1",
          price: 110.0,
          conditions: ["Just Dropped"],
          title: "String",
          caption: "String",
          modelName: "Power",
          modelImage: "model-6",
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "Most Popular",
          description: "Be in the know and grab what's in style right now",
          image: "collection-bg-2",
          price: 110.0,
          conditions: ["Most Popular" ],
          title: "String",
          caption: "String",
          modelName: "Rick",
          modelImage: "model-7",
          isCurrentUser: false
    ),
    
    .init(id: 2,
          name: "Our Favorites",
          description: "We love all of our product but if your looking for our absolute favorite, check these out",
          image: "collection-bg-3",
          price: 320.0,
          conditions: ["Our Favorites" , "our favorites"],
          title: "String",
          caption: "String",
          modelName: "Haha",
          modelImage: "model-8",
          isCurrentUser: false
    ),
    
    .init(id: 3,
          name: "Winter 2021",
          description: "Winter is here and it's getting cold out so ckeck these out",
          image: "collection-bg-4",
          price: 220.0,
          conditions: ["Winter 2021"],
          title: "String",
          caption: "String",
          modelName: "Lorry",
          modelImage: "model-9",
          isCurrentUser: false
    ),
    
    .init(id: 4,
          name: "2020",
          description: "Its the end of the world and you can choose as many as you want",
          image: "collection-bg-5",
          price: 310.0,
          conditions: ["2020"],
          title: "String",
          caption: "String",
          modelName: "Tom",
          modelImage: "model-10",
          isCurrentUser: false
    ),
]
