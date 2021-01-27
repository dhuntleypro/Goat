//
//  ProductDetailsView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ProductDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var product: Product
  //  var productV: ProductVariant

    @State var want = false
    
    @State var isOpen = false
    @State var lightBg = false
    
    @State var maxHeight = 0
    
    @State var showBottonView = true
    @State private var offset: CGFloat = -200.0
    
    var body: some View {
        
    //    GeometryReader { outsideProxy in
            ZStack {
            ScrollView {
             //   GeometryReader { insideProxy in
                    
                        
                        
                        VStack {
                            // Fix (Should be Array of images)
                            ImageSiderView(product: product)
                            
                            ExpressAndCart(product: product)
                            
                            Text(product.name)
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .lineLimit(3)
                                .multilineTextAlignment(.center)
                                .padding(.vertical ,20)
                            
                            Divider()
                            
                            ProductCategorySliderView(product: product)
                            
                            DescriptionView(product: product)
                            
                            ShippingProductView()
                            
                            YouMayAlsoLikeView(product: product)
                        }
                        
                        
                        
                    }
                    

               
                
                VStack {
                    Spacer()
                    BottomSheetSizeView(isOpen: $isOpen, lightBg: $lightBg)
                    
                }
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .padding(.trailing)
                    
                    
                })
            
            , trailing:
                // (fix) should bde product.want
                Button(action: {
                    want.toggle()
                }, label: {
                    Text("Want")
                        .modifier(want ? myWhiteToBlackButton(black: true) : myWhiteToBlackButton(black: false))
                    
                })
            
            
        )
        
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailsView(product: MOCK_PRODUCTS[0])
            
        }
    }
}
