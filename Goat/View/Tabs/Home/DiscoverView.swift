//
//  DiscoverView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI



struct DiscoverView: View {
    
    @State var condition = [String]()
    
    var compareData = [Product]()
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                
                ForEach(MOCK_COLLECTION) { collection in
                    // Section image
                    VStack {
                        // Head Image for Collection
                        NavigationLink(destination: ShopAllView(collection: collection)) {
                            Image(collection.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 600)
                        }
                        
                        // Name and shop all
                        HStack {
                            Text(collection.name)
                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                                .font(.system(size: 22, weight: .medium, design: .default))
                            
                            
                            Spacer()
                            
                            
                            NavigationLink(
                                destination:
                                    ShopAllView( collection: collection)
                                //   Calender()
                                ,
                                label: {
                                    Text("Shop All")
                                        .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                        .font(.system(size: 16, weight: .medium, design: .default))
                                    
                                })
                        }
                        .padding(30)
                        
                        VStack {
                            
                            
                            // FILTERED PRODUCT BY COLLECTION
                            ScrollView(.horizontal, showsIndicators: false){
                               
                                HStack(spacing: 50) {
                                    
                                    ForEach(MOCK_PRODUCTS){ product in
                                        
                                        ForEach(product.tags,id:\.self){ tagName in
                                            
                                            ForEach(collection.conditions,id:\.self) { conditiondata in
                                                
                                                if collection.conditions.count != 0 && conditiondata == tagName {
                                                    NavigationLink(destination: ProductDetailsView(product: product)) {
                                                        
                                                        ProductCell(product: product)
                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.bottom,  100)
        }
        // lessen highlight when holding down on screen
       .buttonStyle(PlainButtonStyle())
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}



