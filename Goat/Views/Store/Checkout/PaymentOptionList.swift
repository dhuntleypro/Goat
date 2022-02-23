//
//  PaymentOptionList.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/7/21.
//

import SwiftUI

struct PaymentOptionList: View {
    @Environment(\.presentationMode) var presentationMode

    
    static let paymentTypes = ["Cash", "Credit Card", "Paypal" , "Square", "Apple Pay"]
    @Binding var paymentType : Int
    
    var body: some View {
        ZStack {
            
            Color(.black).edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    })
                    
                    Spacer()
                }
               
                Spacer()
                
                Text("How do you want to pay?")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                Picker(selection: $paymentType, label: Text("How do you want to pay?")) {
                    
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                            .foregroundColor(.white)
                    }
                }
                .pickerStyle(InlinePickerStyle())
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
    
}

struct PaymentOptionList_Previews: PreviewProvider {
    static var previews: some View {
        PaymentOptionList(paymentType: .constant(0))
    }
}
