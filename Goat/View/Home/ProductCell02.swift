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
            VStack {
                
                HStack(spacing: UIScreen.main.bounds.width/10){
                
                    Text("03/22/2021")
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(.primary)
                    
                    
                    Text("Want")
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(.primary)
                        .modifier(ClearButtonStyleSmall(bgColor: .gray))
                }
                .frame(width: UIScreen.main.bounds.width/2)
                .padding(.top, 20)
      
                
                VStack {
                    // Product Image
                    Image(product.image)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 120)
                    
                }
                .padding(.top, 40)
                .padding(.horizontal, 30)
                
                Text(product.name)
                    .foregroundColor(.primary)
                    .font(.system(size: 12, weight: .regular, design: .default))

                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .padding()
                
              //  Text("$\(item.price.clean)")
                    Text("$356.66")
                    .foregroundColor(.primary)
                    .padding(.bottom, 10)
                    .font(.system(size: 12, weight: .regular, design: .default))

            }
            .frame(width: UIScreen.main.bounds.width/2 , height: 300)
            .padding(.vertical,20)
         //   .navigationBarTitle(item.collection[0], displayMode: .inline)
            
            
        }
        .overlay(Rectangle().stroke(Color.gray, lineWidth: 1))
    }
}


//
//struct ProductCell02_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCell02()
//    }
//}

