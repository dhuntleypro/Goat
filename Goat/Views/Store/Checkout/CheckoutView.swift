//
//  CheckoutView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/6/21.
//



import SwiftUI

struct CheckoutView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var shipTo = true
    @State var inPersonPurchase = false
    @State var shippingCost : Float = 12
    static let paymentTypes = ["Apple Pay", "Credit Card", "Paypal" , "Square", "Cash"]

    @State var checkout = false
    @State var paymentType = 0
    @State var PaymentTypeText = ""

    @State var address = ""
    @State var city = ""
    @State var state = ""
    @State var zip = ""
    
    
    
    var body: some View {
        ZStack {
            
            Color(.white).edgesIgnoringSafeArea(.all)
        VStack {
            
                CartItemSliderView()
                
                
                ScrollView {
                    
                    PaymentSelectionView()
                    
                    ShippingInformationView(shipTo: $shipTo, inPersonPurchase: $inPersonPurchase, shippingCost: $shippingCost, address: $address, city: $city , state : $state , zip : $zip)
                    
                    PricingBreakdownView(shipTo: $shipTo, inPersonPurchase: $inPersonPurchase, shippingCost: $shippingCost)
                    
                    CompleteOrderView(checkout: $checkout , paymentType: $paymentType, PaymentTypeText: $PaymentTypeText, shippingCost: $shippingCost)

                }
            
        }
        
        }
        .navigationBarHidden(true)
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing:
                Button(action: {
                  presentationMode.wrappedValue.dismiss()
          
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
            }
        )
    }
}

//struct CheckoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckoutView(product: MOCK_PRODUCTS[1])
//    }
//}
