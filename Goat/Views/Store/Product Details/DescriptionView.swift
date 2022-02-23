//
//  DescriptionView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
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
                    .foregroundColor(.black)
                Spacer()
            }
            
            
            HStack {
                Text(product.description)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .foregroundColor(.black)

                Spacer()
            }
            .lineLimit(nil)
            .frame( height: 250)
            
            Spacer()
        }
        .padding(.horizontal, 30)
        
    }
}

//struct DescriptionView_Previews: PreviewProvider {
//    static var previews: some View {
//        DescriptionView(product: Product()
//    }
//}
//
