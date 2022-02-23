//
//  SearchBar.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct SearchBar: View {
    // Tip : when make the seperate part - that part is the binding part
    @Binding var text : String
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .foregroundColor(colorScheme == .dark ? Color(.gray) : Color(.gray))
                            .frame(minWidth: 0 , maxWidth: .infinity, alignment: .leading)
                            .padding(.leading , 8)
                   
                    }
                )
        }
        .padding(.horizontal, 10)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."))
    }
}

