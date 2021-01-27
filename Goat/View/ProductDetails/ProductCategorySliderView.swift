//
//  ProductCategorySliderView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ProductCategorySliderView: View {
    var product: Product
  //  var product: ProductVariant

    var body: some View {
        VStack(spacing: 30) {
            HStack{
                ScrollView(.horizontal, showsIndicators: false)  {
                    HStack (spacing : 30 ){
                        VStack {
                            Text("Brand")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            
                            Text(product.brand)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.gray)
                            
                        }
                        
                        
                        Divider()
                        
                        VStack {
                            Text("Category")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                
                            Text(product.category)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.gray)
                        }
                        
                        
                        Divider()
                        
                        VStack {
                            Text("Main Color")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            NavigationLink( destination: Text("Related Products by Color")) {
                                // (fix)
                                Text("Blue")
                                    .underline()
                                    .font(.system(size: 14))
                                    .bold()
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        
                        Divider()
                        
                        VStack {
                            Text("sku")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            
                            Text(product.sku)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(.gray)
                            
                        }
                        
                        
                        Divider()
                        
                        VStack {
                            Text("Release Date")
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            //  Text(product.releaseDate)
                            Text(product.releaseDate)
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
