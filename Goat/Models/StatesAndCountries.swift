//
//  StatesAndCountries.swift
//  Goat
//
//  Created by Darrien Huntley on 1/27/21.
//



import SwiftUI

struct StatesAndCountries: Identifiable {
    let id: Int
    let name: String
    let caption: String
    let image: String
    let isCurrentUser : Bool
    

}

// Data source

let MOCK_STATES_AND_COUNTRIES: [StatesAndCountries] = [
  
    .init(id: 0,
          name: "United States",
          caption: "ff",
          image: "flag",
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "Albania",
          caption: "ff",
          image: "flag",
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "Algeria",
          caption: "ff",
          image: "flag",
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "Barbados",
          caption: "ff",
          image: "flag",
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "British Virgin Island",
          caption: "ff",
          image: "flag",
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "Costa Rico",
          caption: "ff",
          image: "flag",
          isCurrentUser: false
    ),
    
    .init(id: 1,
          name: "Italy",
          caption: "ff",
          image: "flag",
          isCurrentUser: false
    ),
    
]
