//
//  TagView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/27/21.
//

import SwiftUI
import Firebase

struct TagView: View {
    @ObservedObject var productVM = ProductViewModel()
    
    var product : Product
    @Binding var tags : [String]
    
    @State var tag = ""
    @State var createTag = false
    //var tags2 = [""]
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(width: 60, height: 5)
                .foregroundColor(.gray)
                .cornerRadius(10)
                .padding()
            
            HStack {
                Text("Tags")
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                
                Spacer()
                
                Button(action: {
                    createTag.toggle()
                    productVM.fetchProducts()
                }) {
                    Text( "+ Tags" )
                        .modifier(myClearButton100BY35(bgColor: .white))
                }
                
                Button(action: {
                    COLLECTION_PRODUCTS.document(product.id)
                        .updateData(["tags" :  FieldValue.arrayUnion([tag])])
                    
                    
                    productVM.fetchProducts()
                    
                    print(" Tags \(product.tags)")
                }) {
                    Text( "Done" )
                        .modifier(myClearButton100BY35(bgColor: .white))
                }
            }
            .padding(.bottom)
            
            
            if createTag == true {
                HStack {
                    Text("Create: ")
                        .bold()
                    TextField("tags", text: $tag)
                        .modifier(GrayBackgroundScreen())
                    
                    Button(action: {
                        COLLECTION_PRODUCTS.document(product.id)
                            .updateData(["tags" :  FieldValue.arrayUnion([tag])])
                        
                        
                        productVM.fetchProducts()
                    }) {
                        Text("Add")
                            .bold()
                    }
                    
                    Spacer()
                }
            }
            
            
            
            HStack {
                Text("List of Tags")
                    .bold()
                
                Spacer()
                
            }
            .padding(.vertical)
            
            
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns , spacing: 0) {
                    ForEach(product.tags.indices) { idx in
                        HStack {
                            
                            TextField("tags", text: $tags[idx])
                                .modifier(GrayBackgroundScreen())
                                .padding(.bottom , 10)
                            
                            Spacer()
                        }
                    }
                }
                .padding(.bottom, 50)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .foregroundColor(.white)
        .onAppear() {
            productVM.fetchProducts()
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView( product: Product(dictionary: ["Stringe" : "Any"]), tags: .constant(["String" , "String2"]))
    }
}
