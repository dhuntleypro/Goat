//
//  CartProductCell.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/1/21.
//

import SwiftUI
import Kingfisher

struct CartProductCell: View {
  //  var product : Product
    var cart: Cart
    
  //  @State var selectedSize = "S"
   // cartProducts
    var body: some View {
        HStack {
            // Image(item.image)
           // NavigationLink(destination: ProductDetailsView(product: product)){
            VStack{
                ZStack {
                    
                    Text(cart.name)
                  //  Text(product.name)
                    // KFImage(URL(string: cart.images[0]))
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 130 , height:100)
                }
                
               
           }
           
            
//
//            VStack(alignment: .leading) {
//
////                Text("Name: \(cart.name)")
////                Text("Size: \(cart.size)")
////                Text("Color: \(cart.color)")
////
////                Text("$ \(cart.price.clean)")
////                    .padding()
//
//             //   Text("$ total-- \(cart.total)")
//                //    .padding()
//
//
//
//            }
//            .font(.system(size: 14, weight: .bold, design: .rounded))
//            .padding()
//            .foregroundColor(.black)
//
//
//
            
            Spacer()
        }
        .padding()
        
    }
}

//struct CartProducttCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CartProducttCell()
//    }
//}
//
