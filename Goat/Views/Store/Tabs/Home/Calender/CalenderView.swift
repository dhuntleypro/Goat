//
//  CalenderView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct CalenderView: View {
    
    @ObservedObject var viewModel = ProductViewModel()

    var body: some View {
        VStack {
            // search bar
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVGrid(columns: columns , spacing: 0) {
                    ForEach(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailsView(product: product)) {
                            ProductCell02(product: product)
                            
                        }
                    }
                }
                    .padding(.bottom, 100)

            }
            Spacer()

        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}

