//
//  BottomSheetSizeView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/26/21.
//

import SwiftUI

struct BottomSheetSizeView: View {
    
    @Binding var isOpen : Bool
    var body: some View {
        BottomSheetView(isOpen: $isOpen, maxHeight: 650) {
            VStack {
                ScrollView(.horizontal, showsIndicators: true)  {
                    HStack(spacing: 50) {
                        
                        // Scroll Position
//                        VStack {
//                            Text("\(outsideProxy.frame(in: .global).minY - insideProxy.frame(in: .global).minY)")
//                        }
                        
                     //   ForEach(product.images.indices) { idx in
                        ForEach(MOCK_PRODUCT_VARIANT) { productVariant in
                            VStack(spacing: 3) {
                                Text(productVariant.name)
                                  //  .foregroundColor(.red) // on sale
                                    .foregroundColor(.red)
                                    .font(.system(size: 18))
                                
                                Text("$\(productVariant.price.clean)")
                                    .foregroundColor(.white)
                                

                            }
                            .padding(.leading, 40)
                          //  .padding(.bottom, 50)


                            
                        }
                        Spacer()
                      

                    }
                }

            }


            .background(Color.black).edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BottomSheetSizeView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetSizeView(isOpen: .constant(false))
    }
}
