//
//  YouMayAlsoLikeView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct YouMayAlsoLikeView: View {
    //   @EnvironmentObject var authEO : AuthViewModel
    
    @ObservedObject var productVM = ProductViewModel()
    @State var showSheet = false
    //   @Binding var orderId : String
    
    var body: some View {
        
        
        VStack {
            Text("Your May Also Like")
                .font(.system(size: 14, weight: .regular, design: .default))
                .foregroundColor(.black)
            
            LazyVGrid(columns: columns , spacing: 0) {
                ForEach(productVM.products) { product in
                    
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                      //  ProductCell02(product: product)
                        ProductCell01(product: product)

                    }
                //    .navigationViewStyle(StackNavigationViewStyle())
                }
            }
            
            Button(action: {
                
            }) {
                Text("See More")
            }
            .modifier(myClearButton300BY45(bgColor: .black))
            .padding(.vertical, 20)
            
        }
    }
}

//struct YouMayAlsoLike_Previews: PreviewProvider {
//    static var previews: some View {
//        YouMayAlsoLike(item: Product.example)
//    }
//}
