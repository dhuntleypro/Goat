//
//  Product.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//


import SwiftUI

struct Product: Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    let tags: [String]
    let isCurrentUser: Bool
}

// Data source

let MOCK_PRODUCTS: [Product] = [
    .init(id: 0,
          name: "Wmns Air Jordan 4 Retro 'Starfish'",
          description: "Hey what's up",
          image: "680720_01",
          price: 310.0,
          tags: ["accessories"],
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "Air Jordan 1 Retro High OG 'Volt Gold'",
          description: "Hey what's up",
          image: "602213_01",
          price: 110.0,
          tags: ["short"],
          isCurrentUser: false
    ),
    
    .init(id: 2,
          name: "Air Jordan 13 Retro 'Starfish'",
          description: "Hey what's up",
          image: "660244_01",
          price: 320.0,
          tags: ["favorite"],
          isCurrentUser: false
    ),
    
    .init(id: 3,
          name: "Notre x Dunk High 'Midnight Navy'",
          description: "Hey what's up",
          image: "718884_01",
          price: 220.0,
          tags: ["favorite"],
          isCurrentUser: false
    ),
    
    .init(id: 4,
          name: "Toy Story 4 x NMD_R1 Kids 'Bo Peep'",
          description: "Hey what's up",
          image: "EG7316",
          price: 110.0,
          tags: ["accessories"],
          isCurrentUser: false
    ),
]
