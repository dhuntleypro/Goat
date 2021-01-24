//
//  ShippingInformationView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/24/21.
//

import SwiftUI

struct ShippingInformationView: View {
    @Binding var shipTo : Bool
    @Binding var inPersonPurchase : Bool

    var body: some View {
        //SHIPPING
       // NavigationLink(destination: Text("fvfv")) {
            
            
            VStack {
                HStack {
                    Button(action: {
                        shipTo.toggle()
                        inPersonPurchase.toggle()
                    }, label: {
                        Image(systemName: shipTo ? "record.circle" : "circle" )

                    })
                    
                    
                    Text("Ship to")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))

                    
                    Spacer()
                    
                    Text("Ship to Apple Pay Address")
                        .font(.system(size: 14))

                    
                }
                .padding()
                .foregroundColor(.black)
                
                
                Button(action: {}, label: {
                    
                    VStack(alignment: .leading ) {
                        Text("Standard: $12")
                            .foregroundColor(.black)
                            .padding(.bottom, 5)
                        Text("The item will be shipped within 24 hours ")
                            .foregroundColor(.gray)


                    }
                })
                .modifier(ClearButtonStyleleading(bgColor: .black))
                
               
                HStack {
                    Text("*Estimates valid for orders shipping to contiguous US state only.")
                        .foregroundColor(.black)
                        .font(.system(size: 8))
                        .padding()
                    
                    Spacer()
                    
                }
                
                HStack {
                    Button(action: {
                        shipTo.toggle()
                        inPersonPurchase.toggle()
                    }, label: {
                        Image(systemName: shipTo ? "circle" : "record.circle")

                    })
                    
                    
                    Text("Pay now")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))

                    
                    Spacer()
                    
                    Text("In Person")
                        .font(.system(size: 14))

                    
                }
                .padding()
                .foregroundColor(.black)
                
            
            
            Divider()
        }
        
    }
}

struct ShippingInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingInformationView(shipTo: .constant(false), inPersonPurchase: .constant(false))
    }
}
