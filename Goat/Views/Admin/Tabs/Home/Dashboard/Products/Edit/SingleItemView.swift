//
//  SingleItemView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//

import SwiftUI

struct SingleItemView: View {
    
    // price
    @Binding var price_Textfield : String
    @Binding var quantity : String
    
    // Sale Price
    @Binding var onSale : Bool
    @Binding var onSalePrice : String
    
    var product : Product

    
    var body: some View {
        
        VStack {
            
            Rectangle()
                .frame(width: 60, height: 5)
                .foregroundColor(.gray)
                .cornerRadius(10)
                .padding()
            
            HStack {
                Text("Single Item")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                Spacer()
                
                Button(action: {
                    onSale.toggle()
                }) {
                    Text( onSale ? "On Sale" : "No sale" )
                        .modifier(onSale ? myClearButton100BY35(bgColor: .gray) : myClearButton100BY35(bgColor: .black))
                }
            }
            .padding(.bottom)
          
            HStack {
                VStack(alignment: .leading , spacing : 10) {
                    Text("Price")
                        .bold()
                        .foregroundColor(Color.white)
                    
                    HStack(spacing : 0) {
                        Text("$")
                        TextField("price", text: $price_Textfield)
                            .keyboardType(.numberPad)
                    }
                    .modifier(GrayBackgroundSmall())
                    
                    Text("Sale Price")
                        .bold()
                        .foregroundColor(Color.white)

                    HStack(spacing : 0) {
                        Text("$")
                        TextField("on Sale Price", text: $onSalePrice)
                            .keyboardType(.numberPad)
                    }
                    .modifier(GrayBackgroundSmall())


//                    var onSale: Bool
                    //            var onSalePrice : Float // change to nsNumber
                }
                
                VStack(alignment: .leading) {
                    Text("Inventory")
                        .bold()
                        .foregroundColor(Color.white)
                    
                    HStack(spacing : 0) {
                        TextField("quantity", text: $quantity)
                            .keyboardType(.numberPad)
                    }
                    .modifier(GrayBackgroundSmall())
                }
                
                Spacer()
            }
           
            Spacer()
        }
        .padding(.horizontal)
        .foregroundColor(.white)
    }
}

struct SingleItemView_Previews: PreviewProvider {
    static var previews: some View {
        SingleItemView(price_Textfield: .constant(""), quantity: .constant(""), onSale: .constant(false), onSalePrice: .constant(""), product: Product(dictionary: ["String" : "Any"]))
    }
}
