//
//  ProductAnalyticsView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/28/21.
//

import SwiftUI
import Kingfisher

struct ProductAnalyticsView: View {
    
    var product : Product
    
    var body: some View {
        VStack(alignment: .leading , spacing : 50) {
            
            Text(product.name)
                .font(.title)
                .bold()
                .padding(.top)
            
            
            VStack {
                ZStack{
                    KFImage(URL(string: product.images[0]))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                        .clipped()
                    
                    
                    
                    Image(product.onAppImages[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                        .clipped()
                    
                    
                }
            }
            
            Text("In Carts: 5 ") // fix
            
            Text("Likes : 35 ") // fix
            
            Text("Viewed: 135 ") // fix
            
            
            Spacer()
            
        }
    }
}

struct ProductAnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductAnalyticsView(product: Product(dictionary: ["String" : "Any"]))
    }
}
