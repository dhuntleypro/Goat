//
//  ProductVariant.swift
//  Goat
//
//  Created by Darrien Huntley on 1/26/21.
//


import SwiftUI

struct ProductVariant: Identifiable {
    let id: Int
    let name: String
    let brand: String
    let image: String
    let price: Double
    let tags: [String]
    var want: Bool
    let category : String
    let colorway : String
    let sku : String
    let isCurrentUser: Bool
    

}

// Data source

let MOCK_PRODUCT_VARIANT: [ProductVariant] = [
    .init(id: 0,
          name: "XS",
          brand: BRAND_NAME,
          image: "660244_01",
          price: 310.00,
          tags: ["2020", "Our Favorites", "Just Dropped" ],
          want: false,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "S",
          brand: BRAND_NAME,
          image: "660244_01",
          price: 310.00,
          tags: ["2020", "Our Favorites", "Just Dropped" ],
          want: false,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          isCurrentUser: false
    ),
    
    .init(id: 2,
          name: "M",
          brand: BRAND_NAME,
          image: "660244_01",
          price: 310.00,
          tags: ["2020", "Our Favorites", "Just Dropped" ],
          want: false,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          isCurrentUser: false
    ),
    
    .init(id: 3,
          name: "L",
          brand: BRAND_NAME,
          image: "660244_01",
          price: 310.00,
          tags: ["2020", "Our Favorites", "Just Dropped" ],
          
          want: false,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          isCurrentUser: false
    ),
    
    .init(id: 4,
          name: "XL",
          brand: BRAND_NAME,
          image: "660244_01",
          price: 310.00,
          tags: ["2020", "Our Favorites", "Just Dropped" ],
          
          want: false,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          isCurrentUser: false
    ),
]
