//
//  DescriptionView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//


import SwiftUI

struct DescriptionView: View {
    var product: Product

    var body: some View {
        VStack {
            HStack {
                // ROW 3 ( Description )
                Text("Description")
                    .font(.system(size: 22, weight: .regular, design: .rounded))
                Spacer()
            }
            
            
            HStack {
                Text(product.description)
                Spacer()
            }
            .lineLimit(nil)
            .frame( height: 200)
            
            Spacer()
        }
        .padding(.horizontal, 30)
        
    }
}

//struct DescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionView()
//    }
//}
