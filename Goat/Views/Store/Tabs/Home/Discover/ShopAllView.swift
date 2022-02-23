//
//  ShopAllView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Kingfisher

struct ShopAllView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var productVM = ProductViewModel()
    var collection: Collection
    
    @State var conditiondata = ""
    @State var tagName = ""
    @State var showFilter = false
    
  //  let navigationConfigurator = NavigationConfigurator()
    var body: some View {
        ZStack {
            Color(.white).edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
            VStack(spacing: 0) {

                Spacer().frame(height: 0)
        
                ZStack {
                    Image(collection.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width,  height: 300)
                        .clipShape(Rectangle())
                    
                    KFImage(URL(string: collection.images[0]))
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 0)
                     //   .clipped()
                    
                }
             //   Spacer()
            
          

            
                      VStack {
                         Text(collection.title)
                              .foregroundColor(.black)
                              .font(.system(size: 30, weight: .medium, design: .default))
                              .padding()
                           //   .padding(.bottom, 5)

                          Text(collection.description)
                              .font(.system(size: 15, weight: .regular, design: .default))
                            .foregroundColor(.black).opacity(0.8)
                              .padding(.horizontal, 25)
                              .multilineTextAlignment(.center)
                          .padding(.bottom)



          
                        //   FILTERED PRODUCTS BY COLLECTION
                          LazyVGrid(columns: columns , spacing: 0) {
                              ForEach(productVM.products){ product in

                                  ForEach(product.tags,id:\.self){ tagName in

                                      ForEach(collection.conditions,id:\.self) { conditiondata in

                                          if collection.conditions.count != 0 && conditiondata == tagName {
                                              NavigationLink(destination: ProductDetailsView(product: product)
                                              ) {

                                                  ProductCell02(product: product)

                                              }
                                          }
                                      }
                                  }
                              }
                          }
                   
                      }
            Spacer()

   //         }
            }
     //   .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
            
    }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                }
            
            , trailing:
                Button(action: {
                    showFilter.toggle()
                }) {
                    Text("Filter")
                        .foregroundColor(.black)
                    
                }
                .sheet(isPresented: $showFilter) {
                    FilterView()
                }
        
        
        
        )
       
    }
}


struct ShopAllView_Previews: PreviewProvider {
    static var previews: some View {
     //   NavigationView() {
        ShopAllView( collection: Collection(dictionary: ["image" : "collection5"]))
     //   }
    }
}
