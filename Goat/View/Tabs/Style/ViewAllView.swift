//
//  ViewAllView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//



import SwiftUI

struct ViewAllView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var collection: Collection
    
    @State var showFilter = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Image(collection.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .clipShape(Rectangle())
                
                
                Text(collection.name)
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .padding()
                    .padding(.bottom, 5)
                
                Text(collection.description)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .padding(.horizontal, 25)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)

                
                
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
                Button(action: {
                    showFilter.toggle()
                }, label: {
                    Text("Filter")
                        .foregroundColor(.black)
                    
                })
                .fullScreenCover(isPresented: $showFilter) {
                    FilterView()
                }
            
            
        )
    }
}

struct ViewAllView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllView(collection: MOCK_COLLECTION[1])
    }
}






//import SwiftUI
//
//struct ViewAllView: View {
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//
//    var style: Style
//
//    var body: some View {
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack {
//                Image(style.image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: UIScreen.main.bounds.width, height: 300)
//                    .clipShape(Rectangle())
//
//
//                Text(style.name)
//                    .foregroundColor(.black)
//                    .font(.system(size: 30, weight: .medium, design: .default))
//
//                    .padding()
//                    .padding(.bottom)
//
//                Text(style.description)
//                    .font(.system(size: 20, weight: .medium, design: .default))
//
//                // FILTERED PRODUCTS BY COLLECTION
//                LazyVGrid(columns: columns , spacing: 0) {
//                    ForEach(MOCK_PRODUCTS){ product in
//
//                        ForEach(product.tags,id:\.self){ tagName in
//
//                            ForEach(style.conditions,id:\.self) { conditiondata in
//
//                                if style.conditions.count != 0 && conditiondata == tagName {
//                                    NavigationLink(destination: ProductDetailsView(product: product)) {
//
//                                        ProductCell02(product: product)
//
//                                    }
//                                }
//                            }
//                        }
//                    }
//
//                }
//            }
//
//
//        }
//        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(
//            leading:
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//
//                }, label: {
//                    Image(systemName: "arrow.backward")
//                        .foregroundColor(.black)
//                })
//
//            , trailing:
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    Text("Filter")
//                        .foregroundColor(.black)
//
//                })
//
//
//        )
//    }
//}
////
////struct ShopAllView_Previews: PreviewProvider {
////    static var previews: some View {
////        ShopAllView()
////    }
////}
