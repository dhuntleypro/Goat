//
//  ProductCategorySliderView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ProductCategorySliderView: View {
    var product: Product

    var body: some View {
        VStack(spacing: 30) {
            HStack{
                ScrollView(.horizontal, showsIndicators: false)  {
                    HStack (spacing : 30 ){
                        VStack {
                            Text("BRAND")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                           // Text(product.brand)
                            Text(product.description)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.gray)
                            
                        }
                        
                        
                        Divider()
                        
                        VStack {
                            Text("CATEGORY")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                           // Text(product.season)
                            Text(product.description)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.gray)
                        }
                        
                        
                        Divider()
                        
                        VStack {
                            Text("COLORWAY")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            Text(product.description)
                           // Text(product.colorway)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.gray)
                        }
                        
                        
                        Divider()
                        
                        VStack {
                            Text("SKU")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                          //  Text(product.sku)
                            Text(product.description)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.gray)
                        }
                        
                        
                        Divider()
                        
                        VStack {
                            Text("RELEASE DATE")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                          //  Text(product.releaseDate)
                            Text(product.description)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.gray)
                        }
                        
                        
                        
                        
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 30)
                    
                    
                }
            }
            Divider()
        }// end of image scroll
        .padding(.vertical, 30)
    }
}

//struct ProductCategorySliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCategorySliderView()
//    }
//}
