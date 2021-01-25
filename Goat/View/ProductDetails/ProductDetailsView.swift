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
    @State var want = false
    var body: some View {
        ScrollView{
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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
    
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }, label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                    
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

//struct ProductDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            ProductDetailsView(product: Product(id: 0, name: "name", description: "description....", image: "680720_01", price: 355, tags: ["String"], isCurrentUser: true))
//            
//        }
//    }
//}
