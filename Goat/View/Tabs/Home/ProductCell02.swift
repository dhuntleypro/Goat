//
//  ProductCell02.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI


struct ProductCell02: View {
        
    @State var need = false
    
    var product: Product
    
    var body: some View {
        VStack {
        HStack(alignment: .center) {
            Text("03/22/2021")
                .font(.system(size: 12, weight: .regular, design: .default))
                .foregroundColor(.primary)
            Spacer()
            
            NavigationLink(destination: WantView()) {
                Text("Want")
                    .foregroundColor(.primary)
                    .modifier(ClearButtonEvenSmall(bgColor: .gray))
                
                
            }
        }
        .padding(25)
      // .padding(.top, 49)
        .frame(height: 60)

        Image(product.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 130 , height:100)
        
        Text(product.name)
            .foregroundColor(.primary)
            .font(.system(size: 12, weight: .regular, design: .default))
            .multilineTextAlignment(.center)
            .frame(height: 60)
            .padding()
            

        Text("$356.66")
            .foregroundColor(.primary)
            //  .padding(.bottom, 10)
            .font(.system(size: 12, weight: .regular, design: .default))
            .frame(height: 60)
        
        
    }
    .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
    

    }
}



struct ProductCell02_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
        ProductCell02(product: Product(id: 0, name: "String", description: "String", image: "602213_01", price: 330, tags: ["String"], isCurrentUser: true))

        }
    }
}
//
//VStack {
//    VStack {
//
//        HStack(){
//
//            Text("03/22/2021")
//                .font(.system(size: 12, weight: .regular, design: .default))
//                .foregroundColor(.primary)
//
//            Spacer()
//            Text("Want")
//                .font(.system(size: 12, weight: .regular, design: .default))
//                .foregroundColor(.primary)
//                .modifier(ClearButtonStyleSmall(bgColor: .gray))
//        }
//        .padding(.horizontal)
//        .frame(width: UIScreen.main.bounds.width/1.9)
//
//
//
//        VStack {
//            // Product Image
//            Image(product.image)
//                .resizable()
//                .renderingMode(.original)
//                .aspectRatio(contentMode: .fit)
//        }
//        .padding(.top, 40)
//        .padding(.horizontal, 30)
//        .frame(width: 150, height: 120)
//
//
//
//        Text(product.name)
//            .foregroundColor(.primary)
//            .font(.system(size: 12, weight: .regular, design: .default))
//            .multilineTextAlignment(.center)
//            .padding()
//            .frame(height: 50)
//
//
//      //  Text("$\(item.price.clean)")
//            Text("$356.66")
//            .foregroundColor(.primary)
//            .padding(.bottom, 10)
//            .font(.system(size: 12, weight: .regular, design: .default))
//
//
//
//    }
//
//    .padding(.vertical,20)
//    .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
//    .frame(width: UIScreen.main.bounds.width/1.9)
//    .background(Color(.red))
//
// //   .navigationBarTitle(item.collection[0], displayMode: .inline)
//
//
//}
