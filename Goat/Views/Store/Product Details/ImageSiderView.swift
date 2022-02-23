//
//  ImageSiderView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Kingfisher

struct ImageSiderView: View {
    var product: Product
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true)  {
            HStack(spacing: 50) {
                
                ZStack {

                    ForEach(product.onAppImages.indices) { idx in
                        Image(product.onAppImages[idx])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 360)
                    }

              
                    ForEach(product.images.indices) { idx in
                        KFImage(URL(string: product.images[idx]))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 360)

                    }
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
