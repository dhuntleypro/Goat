//
//  Style.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//


import SwiftUI


struct Style: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    let isCurrentUser: Bool
}

// Data source

let MOCK_STYLE: [Style] = [
    .init(id: 0,
          name: "Just Dropped",
          description: "Hey what's up",
          image: "collection-bg-1",
          price: 110.0,
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "T-Shirts",
          description: "Hey what's up",
          image: "collection-bg-2",
          price: 110.0,
          isCurrentUser: false
    ),
    
    .init(id: 2,
          name: "Shorts",
          description: "Hey what's up",
          image: "collection-bg-3",
          price: 320.0,
          isCurrentUser: false
    ),
    
    .init(id: 3,
          name: "Favorites",
          description: "Hey what's up",
          image: "collection-bg-4",
          price: 220.0,
          isCurrentUser: false
    ),
    
    .init(id: 4,
          name: "Most Popular",
          description: "Hey what's up",
          image: "collection-bg-5",
          price: 310.0,
          isCurrentUser: false
    ),
]

