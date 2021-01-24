//
//  ShopAllView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ShopAllView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var collection: Collection
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image(collection.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 330)
                
                
                Text(collection.name)
                    .foregroundColor(.blue)
                
                
                
                Text(collection.description)
                    .bold()
                
                ProductCell02Loop()
                
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
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Filter")
                        .foregroundColor(.black)
                    
                })
            
            
        )
    }
}
//
//struct ShopAllView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopAllView()
//    }
//}
