//
//  ImageSiderView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ImageSiderView: View {
    var product: Product

    var body: some View {
        ScrollView(.horizontal, showsIndicators: true)  {
            HStack(spacing: 50) {
             //   ForEach(product.images.indices) { idx in
                ForEach(product.images.indices) { idx in

                    Image(product.images[idx])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 360)
                    
                }
            }
            .padding(50)
            
        }
        Divider()
            .offset(y:-10)
    }
}


//struct ImageSiderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageSiderView(product:  MOCK_PRODUCTS))
//    }
//}
