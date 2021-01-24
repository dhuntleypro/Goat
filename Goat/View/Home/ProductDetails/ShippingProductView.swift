//
//  ShippingProductView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ShippingProductView: View {
    var body: some View {
        VStack {
            Button(action: {
                
            }) {
                Text("Shipping and Returns")
                    .underline()
                    .foregroundColor(.primary)
            }
            
            
            .padding(20)
            
            HStack(spacing: 20) {
                Button(action: {
                    
                }) {
                    Text("Shop More")
                }
                .modifier(ClearButtonEven(bgColor: .black))
                
                Button(action: {
                    
                }) {
                    Text("Best")
                }
               .modifier(ClearButtonEven(bgColor: .black))
                
                Button(action: {
                    
                }) {
                    Text("Share")
                }
               .modifier(ClearButtonEven(bgColor: .black))
            }
            
            Divider()
        }
        .padding(.bottom, 20)
    }
}

struct ShippingProductView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingProductView()
    }
}
