//
//  PaymentSelectionView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/24/21.
//

import SwiftUI

struct PaymentSelectionView: View {
    var body: some View {
        NavigationLink(destination: Text("Destination")) {
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
                
                HStack {
                    Image(systemName: "app")
                    Text("Apple Pay")
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
