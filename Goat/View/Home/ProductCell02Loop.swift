//
//  ProductCell02Loop.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ProductCell02Loop: View {
    var body: some View {
        VStack {
            
            
//
//            HStack {
//                LazyVGrid(columns: columns) {
//                    ForEach(MOCK_PRODUCTS) { product in
//                        NavigationLink(destination:Text("Product Detail")) {
//                            ProductCell02(product: product)
//                        }
//                        .padding(.bottom, -8)
//                    }
//                }
//            }
//
            
            
            
            
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
    }
}

struct ProductCell02Loop_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell02Loop()
    }
}
