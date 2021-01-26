//
//  RelatedProductView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/25/21.
//

import SwiftUI

struct RelatedProductView: View {
    var body: some View {
        VStack {
            Text("Shop This Style")
                .font(.title)
                .bold()
            
            Divider()
            
            ForEach(MOCK_PRODUCTS) { product in
                VStack {
                HStack {
                    Image(product.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text(product.brand)
                            .foregroundColor(.gray)
                        Text(product.name)
                    }
                    .font(.system(size: 14))
                }
                .padding()
                    
                Divider()
                
                }
            }
            
        }
        .padding()
    }
}

struct RelatedProductView_Previews: PreviewProvider {
    static var previews: some View {
        RelatedProductView()
    }
}
