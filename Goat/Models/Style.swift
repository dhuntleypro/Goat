//
//  Style.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//


import SwiftUI


struct Style: Identifiable {
    let id: Int
    let name: String // model name
    let title: String
    let caption: String
    let description: String
    let image: String
    let price: Double
    let conditions : [String]
    let tags: [String]
    let isCurrentUser: Bool
}

// Data source

let MOCK_STYLE: [Style] = [
    .init(id: 0,
          name: "Mark White",
          title: "Street Style",
          caption: "Heart",
          description: "Hey what's up",
          image: "style-bg-1",
          price: 110.0,
          conditions: ["shorts"],
          tags: ["shorts"],
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "J Right",
          title: "Greatest Spotlight",
          caption: "J Right",
          description: "Hey what's up",
          image: "style-bg-2",
          price: 110.0,
          conditions: [""],
          tags: ["shorts"],
          isCurrentUser: false
    ),
    
    .init(id: 2,
          name: "Rick Sanchez",
          title: "Style Icon",
          caption: "Rick Sanchez",
          description: "Hey what's up",
          image: "style-bg-3",
          price: 320.0,
          conditions: [""],
          
          tags: ["shorts"],
          isCurrentUser: false
    ),
    
    .init(id: 3,
          name: "Dret Jien",
          title: "Blue Gang",
          caption: "True People",
          description: "Hey what's up",
          image: "style-bg-4",
          price: 220.0,
          conditions: [""],
          tags: ["shorts"],
          isCurrentUser: false
    ),
    
    .init(id: 4,
          name: "Moss Sea",
          title: "Fall Collection",
          caption: "Love Harder",
          description: "Hey what's up",
          image: "style-bg-5",
          price: 310.0,
          conditions: [""],
          tags: ["shorts"],
          isCurrentUser: false
    ),
]

