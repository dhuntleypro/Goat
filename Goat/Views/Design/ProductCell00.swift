//
//  ProductCell00.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Kingfisher

struct ProductCell00: View {
    
    var product: Product
    var body: some View {
        
        
        
        VStack(alignment: .center, spacing: 50) {
            
            ZStack {
                Image(product.onAppImages[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 130)
                
                KFImage(URL(string: product.images[0]))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 130)
            }
            
            
            
            HStack(alignment: .center){
                Text(product.name)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .frame(width: 170)
                    .foregroundColor(.black)
                
            }
            
            if product.sizePricing.count > 1 { // non variant
                
                if product.sizePricing[0] != 0 {
                //    Text("$\(product.sizePricing[0])") // non variant
                    Text(getPrice(value: product.sizePricing[0]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                    
                } else if product.sizePricing[0] == 0 {
                     Text(getPrice(value: product.sizePricing[1]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                } else if product.sizePricing[1] == 0 {
                    Text(getPrice(value: product.sizePricing[2]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                } else if product.sizePricing[2] == 0 {
                    Text(getPrice(value: product.sizePricing[3]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.primary)
                        .padding(.bottom, 30)
                    
                } else if product.sizePricing[3] == 0 {
                    Text(getPrice(value: product.sizePricing[4]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                } else if product.sizePricing[4] == 0 {
                  //  Text("$\(product.sizePricing[5])") // non variant
                    Text(getPrice(value: product.sizePricing[5]))
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                }  else if product.sizePricing[5] == 0 {
                    Text("Size Limited") // non variant
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .frame(width: 170)
                        .foregroundColor(.black)
                        .padding(.bottom, 30)
                    
                }
                
            } else {

                Text(getPrice(value: product.cost))
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .frame(width: 170)
                    .foregroundColor(.black)
                    .padding(.bottom, 30)
                
            }
        }
        .padding(.leading, 30)
        .padding(.vertical,50)
        
        
    }
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}

//struct ProductCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCell(product: MOCK_PRODUCTS[1])
//    }
//}
