//
//  CheckoutView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct CheckoutView: View {
    var product : Product
    
    @State var shipTo = true
    @State var inPersonPurchase = false
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>


    var body: some View {
        VStack {
            
            VStack {
                HStack {
                    Spacer()
                    Text("Checkout")
                    Spacer()
                    
                    Button(action: {
                    presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
               
                
                CartItemSliderView()
                
                
                ScrollView {
                    
                    PaymentSelectionView()
                    
                    ShippingInformationView(shipTo: $shipTo, inPersonPurchase: $inPersonPurchase)
                    
                    PricingBreakdownView(shipTo: $shipTo, inPersonPurchase: $inPersonPurchase)
                }
            }
        }
        
        .navigationBarHidden(true)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(product: MOCK_PRODUCTS[1])
    }
}
