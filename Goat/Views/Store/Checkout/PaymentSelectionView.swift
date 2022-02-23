//
//  PaymentSelectionView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/6/21.
//


import SwiftUI

struct PaymentSelectionView: View {
    
     let paymentTypes = ["Apple Pay", "Credit Card", "Paypal" , "Square", "Cash"]
    @State private var paymentType = 0
    
    var body: some View {
        NavigationLink(destination: PurchaseAndReturnPolicyView()) {
            Text("View our Purchase & Return Policy")
                .underline()
                .foregroundColor(.black)
                .font(.system(size: 12))
           
        }
        .padding()
        
        Divider()
        
        //SELECT PAYMENT
        NavigationLink(destination: Text("fvfv")) {
            HStack {
                
                Text("Payment")
                
                Spacer()
                

                NavigationLink(destination: PaymentOptionList(paymentType: $paymentType) ) {
                    
                    HStack {
                        Image(systemName: "app")
                        Text("\(paymentTypes[paymentType])")
                    }
                }
                
               
            }
            .padding()
            .foregroundColor(.black)
            .font(.system(size: 14))

        }
        
        Divider()
    }
}

struct PaymentSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentSelectionView()
    }
}
