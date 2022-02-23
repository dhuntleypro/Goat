//
//  DiscoverView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Kingfisher

struct DiscoverView: View {
    @EnvironmentObject var auth: AuthViewModel
    
    @StateObject var productVM = ProductViewModel()
    @StateObject var collectionVM = CollectionViewModel()
    
 //   @State var editMode = false
    @Binding var editMode : Bool

    
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State private var images:[Identifiable_UIImage] = []
    
    @State var show_reviewSheet = false
    
    
    // @State var condition = [""]
    @State var condition = [String]()
    
    var compareData = [Product]()
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ForEach(collectionVM.collections){ collection in
                    // COLLECTION HEADER IMAGE
                    NavigationLink(destination: ShopAllView(collection: collection)
                                   
                                   
                    ) {
                        ZStack {
                            // stored image
                            Image(collection.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 600)
                            
                            // uploaded image from user photos
                            KFImage(URL(string: collection.images[0]))
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 600)
                        }
                    
                    }
                    .buttonStyle(PlainButtonStyle()) // lessens highlight on Image

                    
                    
                    
                    // TITLE + SHOP ALL
                    HStack {
                        // Text("Feature")
                        Text(collection.title)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                            .font(.system(size: 22, weight: .medium, design: .default))
                        
                        
                        Spacer()
                        
                        
                        NavigationLink( destination: ShopAllView( collection: collection)
                        ) {
                            Text("Shop All")
                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                .font(.system(size: 16, weight: .medium, design: .default))
                        }
                    }
                    .padding(30)
                    
                    
                    // RELATED PRODUCTS
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 50) {
                            
                            ForEach(productVM.products){ product in
                                
                                ForEach(product.tags,id:\.self){ tagName in
                                    
                                    ForEach(collection.conditions,id:\.self) { conditiondata in
                                  
                                        if collection.conditions.count != 0 && conditiondata == tagName {
                                            NavigationLink(destination: ProductDetailsView(product: product)
                                            
                                            ) {
                                                
                                                ProductCell00(product: product)

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
        .onAppear() {
            print("")
            collectionVM.fetchCollections()
        }
    }
}

//struct DiscoverView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiscoverView(swiped: .constant(false))
//    }
//}
