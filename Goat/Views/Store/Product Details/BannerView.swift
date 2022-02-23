//
//  BannerView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/9/21.
//

import SwiftUI

struct BannerView: View {
    @Binding var showAddToCartAlert : Bool
    @Binding var showCommonBanner : Bool
    
    
    var body: some View {
        VStack {
            
            if showCommonBanner == true {
                VStack {

                    Text("Apply [ 249566 ] coupon Code for 20% off")
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width)
                        .background(Color.black)
                        .offset(y: -50)
                    //    .padding(.bottom , 225)
                        .animation(.easeIn)

                }
            }
            
            if showAddToCartAlert == true {

            VStack {

                Text("Please select a size")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width)
                    .background(Color.black)
                    .offset(y: -50)
                //    .padding(.bottom , 225)
                    .animation(.easeIn)


                Spacer()
            }
            }
        }
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(showAddToCartAlert: .constant(false), showCommonBanner: .constant(false))
    }
}
