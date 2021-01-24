//
//  CartView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(MOCK_PRODUCTS) { rr in
                    NavigationLink( destination: ProductDetailsView(product: rr)) {
                        
                        CartProducttCell()
                    }
                }
            }
        }
        
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
