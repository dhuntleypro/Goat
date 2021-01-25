//
//  StyleDetailsView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct StyleDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var product: Product
    @State var like = false
    var body: some View {
        VStack {
            VStack {
               
                   // ForEach(product.modelImages.indices) { idx in
                        ZStack(alignment: .bottomTrailing) {
                            
                    //    Image(product.modelImages[idx])
                            Image(product.modelImages[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 700)
                        
                        Button(action: {}) {
                            ZStack {
                                Image(systemName: "circle")
                                Text("5")
                                    
                            }
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 75, height: 75)
                        .padding()
                        
                 //   }
                    
                 
                   
                }
            }
            
            Spacer()
            HStack {
                Button(action: {
                    like.toggle()
                }) {
                    HStack {
                        Text("55")
                        Text("LIKES")
                    }
                }
                .modifier(like ? myWhiteToBlackButton(black: true) : myWhiteToBlackButton(black: false))
                .padding()
                
                Spacer()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing)
                    
                    Button(action: {}) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)

                            
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)

                    }
                    
                }
            
            ,trailing:
                Button(action: {}) {
                    Image(systemName: "contextualmenu.and.cursorarrow")
                }
        )
    }
}

struct StyleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StyleDetailsView(product: MOCK_PRODUCTS[1])
    }
}
