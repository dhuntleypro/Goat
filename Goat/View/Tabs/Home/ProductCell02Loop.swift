//
//  ProductCell02Loop.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI


struct ProductCell02Loop: View {
    var body: some View {
        
        LazyVGrid(columns: columns , spacing: 0) {
            ForEach(MOCK_PRODUCTS) { product in
                NavigationLink(destination: ProductDetailsView(product: product)) {
                    ProductCell02(product: product)
                    
                }
            }
        }
    }
}

                    
                    
          
struct ProductCell02Loop_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductCell02Loop()
        }
    }
}
