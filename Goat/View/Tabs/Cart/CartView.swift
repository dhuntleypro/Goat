//
//  CartView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct CartView: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Cart")
                    .font(.system(size: 30, weight: .bold))
                
                Spacer()
                
                // Button(action: {}) {
                NavigationLink(destination:
                                CheckoutView(product:
                                                Product(id: 0,
                                                        name: "name",
                                                        description: "string",
                                                        image: "string",
                                                        images: ["string"],
                                                        price: 0.0,
                                                        tags: ["string"],
                                                        isCurrentUser: true
                                                )
                                             
                                )) {
                    Text("Checkout")
                        .modifier(ClearButtonStyleSmall(bgColor: .black))
                }
            }
            .padding()
            
            ScrollView {
                VStack {
                    ForEach(MOCK_PRODUCTS) { product in
                        NavigationLink( destination: ProductDetailsView(product: product)) {
                            
                            CartProducttCell(product: product)
                            
                        }
                        Divider()

                    }
                }
            }
            

        }
        .navigationBarHidden(true)
        
        
        
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
