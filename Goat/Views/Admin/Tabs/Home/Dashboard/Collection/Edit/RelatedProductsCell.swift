//
//  RelatedProductsCell.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/29/21.
//

import SwiftUI
import Kingfisher


struct RelatedProductsCell: View {
    
    var product: Product
    
    var body: some View {
        HStack {
            VStack {
                ZStack{
                    KFImage(URL(string: product.images[0]))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .clipped()
                    
                    
                    
                    Image(product.onAppImages[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .clipped()
                }
            }
            VStack(alignment: .leading){
                
                Text(product.name)
                    .font(.subheadline)
            }
            .padding(.trailing)
            
            Spacer()
        }
    }
}

struct RelatedProductsCell_Previews: PreviewProvider {
    static var previews: some View {
        RelatedProductsCell(product: Product(dictionary: ["String" : "Any"]))
    }
}
