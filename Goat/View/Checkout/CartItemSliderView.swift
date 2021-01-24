//
//  CartItemSliderView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/24/21.
//

import SwiftUI

struct CartItemSliderView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: true)  {
                HStack(spacing: 50) {
                    ForEach(0..<8) { _ in
                        VStack {
                            //  Image(product.image)
                            Image("660244_01")
                                
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            VStack {
                                Text("Air Jordan 13 Retro 'Starfish'")
                                
                                Text("US S / New in the Box / $345.56")
                            }
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                        }
                        .frame(width: UIScreen.main.bounds.width, height: 100)
                    }
                }
            }
            
            Divider()
        }
    }
}

struct CartItemSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemSliderView()
    }
}
