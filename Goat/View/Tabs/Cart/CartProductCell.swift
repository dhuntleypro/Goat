//
//  CartProductCell.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//


import SwiftUI

struct CartProducttCell: View {
    var body: some View {
        HStack {
            Image("batman")
                .resizable()
                .renderingMode(.original)
                .frame(width: 170, height: 170)
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text("Name")
                Text("Size: S")
                Text("Color: Black")
            }
            .font(.system(size: 17, weight: .light, design: .rounded))
            .padding()
            Spacer()
        }
        .padding()
    }
}

struct CartProducttCell_Previews: PreviewProvider {
    static var previews: some View {
        CartProducttCell()
    }
}

