//
//  ProductCell01.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Kingfisher

struct ProductCell01: View {
    var product : Product
    var body: some View {
        HStack {
            
            VStack {
                HStack(spacing: 20) {
                    
                    ZStack {
                        
                        KFImage(URL(string: product.images[0]))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .cornerRadius(10)
                            .clipped()
                        
                        
                        Image(product.onAppImages[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            .cornerRadius(10)
                            .clipped()
                        
                        
                    }
                    .shadow(radius: 10.0)
                    
                        
//                        Text(product.name)
//                            .foregroundColor(.black)
//                            .font(.system(size: 15, weight: .bold))
//                            .frame(width: 100)
                }
                .padding()
            }
        }
        // .frame(width: 150 , height: 175)
    }
}

struct ProductCell01_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell01(product: Product(dictionary: ["String" : "Any"]))
    }
}
