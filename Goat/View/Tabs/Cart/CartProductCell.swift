//
//  CartProductCell.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//


import SwiftUI

struct CartProducttCell: View {
    var product : Product
    var body: some View {
        HStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130 , height:100)
            
            VStack(alignment: .leading) {
            
                Text("Name: \(product.name)")
                Text("Size: S")
                Text("Color: black")
            // Text("Color: \(product.size)")
          //      Text("Color: \(product.color)")
            }
            .font(.system(size: 14, weight: .light, design: .rounded))
            .padding()
            .foregroundColor(.black)
            Spacer()
        }
        .padding()
        
    }
}

//struct CartProducttCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CartProducttCell()
//    }
//}
//
