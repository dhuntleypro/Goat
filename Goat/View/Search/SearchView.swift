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
            
         //   VStack(alignment: .leading) {
                
               ScrollView(.vertical, showsIndicators: false) {
                        HStack(spacing:-4) {
                            
                            LazyVGrid(columns: columns) {
                                
                                ForEach(MOCK_PRODUCTS) { product in
                                    NavigationLink(destination: ProductDetailsView(product: product)) {
                                        ProductCell02(product: product)
                                    }
                                    .padding(.bottom, -8)
                                }
                            }
                            .padding(.trailing, 8)
                            // .padding(-8) // right side is a little out
                            
                        }
                
                        
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
