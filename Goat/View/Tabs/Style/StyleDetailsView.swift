//
//  StyleDetailsView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct StyleDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var style: Style
    @State var like = false
    
    

    @State var showRelatedProducts = false
    
//    @State private var currentIndex = 0
//    @State private var numberOfImages = 5 // get from style count
//
//    func previous(style: Style) {
//
//        _ = style.images.count
//
//        currentIndex = currentIndex > 0 ? currentIndex - 1 : numberOfImages - 1
//    }
//
//    func next() {
//        currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
//    }
//
//
    
    
    var body: some View {
        
        TabView{
       
            
             //   ScrollView(.horizontal) {
                ForEach(style.modelImages.indices) { idx in
                   
                    VStack {
                 //   HStack{
                    HStack {
                    ZStack(alignment: .bottomTrailing) {
                        
                            Image(style.modelImages[idx])
                  //      Image(style.modelImages[3])
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 670)
                            .clipShape(Rectangle())
                        
                        Button(action: {
                            self.showRelatedProducts.toggle()
                        }) {
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 40, weight: .regular))
                                    .foregroundColor(.white)
                                
                                
                                Text("5")
                                    .font(.system(size: 10, weight: .regular))
                                    .foregroundColor(.black)
                            }
                            .padding()
                            
                        }
                        .frame(width: 75, height: 75)
                        .sheet(isPresented: $showRelatedProducts) {
                            RelatedProductView()
                        }
                    }
                    }
             //   }
                
                Spacer()
                HStack {
                    Button(action: {
                        like.toggle()
                    }) {
                        Text("55 LIKES")
                    }
                    .modifier(like ? myWhiteToBlackButton(black: true) : myWhiteToBlackButton(black: false))
                    .padding()
                    
                    Spacer()
                }
                        Spacer()

            }
        }
        }
        .tabViewStyle(PageTabViewStyle())
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
                    
                    Button(action: {
                    //    previous()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        
                    //    next()
                    }) {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                    }
                }
            
            
            ,trailing:
                Button(action: {}) {
                    Image(systemName: "contextualmenu.and.cursorarrow")
                        .foregroundColor(.black)
                }
        )
    }
}

struct StyleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StyleDetailsView(style: MOCK_STYLE[1])
    }
}
