//
//  ProductCell.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    var body: some View {
     
            
           
            VStack(alignment: .center, spacing: 50) {
                Image(product.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 130)
                

                HStack(alignment: .center){
                    Text(product.name)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.primary)
                    
                }
                
                Text("$\(product.price.clean)")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .frame(width: 170)
                    .foregroundColor(.primary)
                    .padding(.bottom, 30)

                
                
            }
            .padding(.leading, 30)
            .padding(.vertical,50)
        
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: MOCK_PRODUCTS[1])
    }
}
