//
//  PricingBreakdownView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/24/21.
//

import SwiftUI

struct PricingBreakdownView: View {
    @Binding var shipTo : Bool
    @Binding var inPersonPurchase : Bool
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                // SUBTOTAL
                HStack {
                    Text("Subtotal")
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("$243")
                        .foregroundColor(.black)
                }
                .padding(10)
                
                // SHIPPING
                HStack {
                    Text("Shipping")
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("$12")
                        .foregroundColor(.black)
                }
                .padding(10)
                
                // ESTIMATED TAX
                HStack {
                    Text("Estimated")
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("$22.64")
                        .foregroundColor(.black)
                }
                .padding(10)
                
                
                // TOTAL
                HStack {
                    Text("Total")
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("$277.64")
                        .foregroundColor(.black)
                }
                .padding(10)
            }
            .padding(.bottom, 20)
            
            
            
            Button(action: {}, label: {
                Text("Checkout")
            })
            .modifier(myBlackCheckout(bgColor: .black))
            
            Text("By proceeding, I confirm I have read and agree to the Purchase & Return Policy")
                .font(.system(size: 8))
                .foregroundColor(.gray)
                .padding(5)
            
        }
        .font(.system(size: 10))
        
        
    }
}

struct PricingBreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        PricingBreakdownView(shipTo: .constant(false), inPersonPurchase:  .constant(false))
    }
}
