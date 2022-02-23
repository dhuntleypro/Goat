//
//  OrderCell.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/23/21.
//

import SwiftUI

struct OrderCell: View {
    var order : Order
    var body: some View {
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(order.customerName)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("cart: \(order.amount.clean)")
                    
                    if order.isCompleted == false {
                        Text("Not Fufilled")
                            .bold()
                    } else {
                        Text("Fufilled")
                            .bold()
                    }
                }
                
                Spacer()
                
                Text("$ \(order.total.clean)")
                    .font(.system(size: 20))
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .regular))
                    .padding()
            }
        }
        .foregroundColor(.black)
        .font(.system(size: 12, weight: .regular, design: .default))
    //    .frame(width: 60, height: 35, alignment: .center)
        .padding()
        .background(Color.clear)
        .cornerRadius(4)
        .contentShape(Rectangle())
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}

struct OrderCell_Previews: PreviewProvider {
    static var previews: some View {
        OrderCell(order: Order(dictionary: ["String" : "Any"]))
    }
}
