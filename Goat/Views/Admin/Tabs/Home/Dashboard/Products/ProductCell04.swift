//
//  ProductCell04.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//
//
//import SwiftUI
//import Kingfisher
//
//struct ProductCell04: View {
//    
//    var product : Product
//    
//    var body: some View {
//        VStack {
//        NavigationLink(destination: EditProductView( product: product)) {
//            
//            HStack {
//                
//                
//                ZStack {
//                KFImage(URL(string: product.images[0]))
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 25, height: 25)
//                    .cornerRadius(10)
//                    .clipped()
//                
//                
//                
//                Image(product.onAppImages[0])
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 25, height: 25)
//                    .cornerRadius(10)
//                    .clipped()
//                }
//                
//                Spacer()
//                
//                VStack(alignment: .leading) {
//                    
//                    Text("\(product.name)")
//                        .bold()
//                    
//                    Text("$\(Double(product.cost).cleanCurrency)")
//                }
//            }
//           
//        }
//        }
//    }
//}
//
//struct ProductCell04_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCell04(product: Product(dictionary: ["String" : "Any"]))
//    }
//}
