//
//  SearchView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    // VIEW MODEL
   // @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ProductCell02Loop()
                
            }
                
           // }
            Spacer()
        }
        .navigationBarHidden(true)
      //  .navigationTitle("Search")
      //  .navigationBarTitle("test")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
