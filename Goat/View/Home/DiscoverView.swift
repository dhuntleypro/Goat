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
                                        .font(.system(size: 22, weight: .medium, design: .default))
                                    
                                })
                        }
                        .padding(30)
                        
                        VStack {
                            
                            
                            // Product Slider
                            ScrollView(.horizontal, showsIndicators: false)
                            {
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
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
        
    }
}









//
//struct DiscoverView: View {
//
//    // Firebase
//    // @ObservedObject private var collectionsListener = CollectionsListener()
//    // @ObservedObject private var productsListener = ProductsListener()
//
//
//
//    @State var condition = [String]()
//
//    var compareData = [Product]()
//
//    var body: some View {
//
//        ScrollView {
//            VStack {
//
//                ForEach(MOCK_COLLECTION) { collection in
//
//                    NavigationLink( destination: ShopAllView(collection: collection)) {
//                        Image(collection.image)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: UIScreen.main.bounds.width, height: 600)
//                    }
//
//                    VStack {
//                        HStack {
//                            Text(collection.name)
//                                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
//                                .font(.system(size: 22, weight: .medium, design: .default))
//
//                            Spacer()
//
//                            NavigationLink( destination: ShopAllView(collection: collection)) {
//                                Text("Shop All")
//                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
//                                    .font(.system(size: 22, weight: .medium, design: .default))
//                            }
//                        }
//                        .padding(30)
//
//                        VStack {
//
//
//                            // Product Slider
//                            ScrollView(.horizontal, showsIndicators: false) {
//                                HStack(spacing: 50) {
//
//                                    ForEach(MOCK_PRODUCTS){ product in
//
//                                        ForEach(product.tags,id:\.self){ tagName in
//                                            ForEach(collection.conditions,id:\.self) { conditiondata in
//                                                if collection.conditions.count != 0 && conditiondata == tagName {
//                                                    NavigationLink(destination: ProductDetailsView(product: product)) {
//
//                                                        ProductCell(product: product)
//                                                    }
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//            .edgesIgnoringSafeArea(.all)
//            .navigationBarHidden(true)
//        }
//
//    }
//}
