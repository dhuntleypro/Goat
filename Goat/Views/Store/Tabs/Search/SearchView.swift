//
//  SearchView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct SearchView: View {
    @EnvironmentObject var authEO: AuthViewModel

    @ObservedObject var viewModel = SearchViewModel()
    @ObservedObject var productVM = ProductViewModel()
    
    @State var searchText = ""
    //   @Binding var storeId : String
  //  @Binding var orderId : String

    var body: some View {
        VStack(spacing: 1) {
                SearchBar(text: $searchText)
                
            Divider()
                .padding(.top, 5)
                
                // search bar
                ScrollView(.vertical, showsIndicators: false) {
                   LazyVGrid(columns: columns , spacing: 0) {
                    ForEach(searchText.isEmpty ? productVM.products : viewModel.filterProducts(searchText) ) { product in
                        //   if authEO.store_id == product.fromId {
          
                    
                            NavigationLink(destination: ProductDetailsView(product: product)) {
                                    ProductCell02(product: product)
                                }
                        //    }
                        }
                    }
                }
                //Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

