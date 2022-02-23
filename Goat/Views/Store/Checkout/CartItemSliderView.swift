//
//  CartItemSliderView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/6/21.
//


import SwiftUI
import Kingfisher


struct CartItemSliderView: View {
    
    @ObservedObject var cartVM = CartViewModel()

    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: true)  {
                HStack(spacing: 50) {
                    ForEach(cartVM.items) { cart in
                        VStack {
                          
                            ZStack {
                                Image(cart.demoImage[0])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                
                                KFImage(URL(string: cart.image))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                            }
                            
                            
                            VStack {
                                Text(cart.name)
                                
                                Text("US \(cart.size) / New in the Box / \(getPrice(value: cart.cost))")
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
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}

struct CartItemSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemSliderView()
    }
}
