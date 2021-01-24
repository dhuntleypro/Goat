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
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .medium, design: .default))
                    
                    .padding()
                    .padding(.bottom)
                
                Text(collection.description)
                    .font(.system(size: 20, weight: .medium, design: .default))
                
                // FILTERED PRODUCTS BY COLLECTION
                LazyVGrid(columns: columns , spacing: 0) {
                    ForEach(MOCK_PRODUCTS){ product in
                        
                        ForEach(product.tags,id:\.self){ tagName in
                            
                            ForEach(collection.conditions,id:\.self) { conditiondata in
                                
                                if collection.conditions.count != 0 && conditiondata == tagName {
                                    NavigationLink(destination: ProductDetailsView(product: product)) {
                                        
                                        ProductCell02(product: product)
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                }
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
