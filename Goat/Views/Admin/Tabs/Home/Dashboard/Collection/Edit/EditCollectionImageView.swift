//
//  EditCollectionImageView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/9/21.
//

import SwiftUI
import Kingfisher


struct EditCollectionImageView: View {
    @ObservedObject var collectionVM = CollectionViewModel()
    
    var collection : Collection
    
    @Binding var images:[String]
    @Binding var showImagePicker : Bool
    @State var selectedUIImage: UIImage?
    
    @State var image : Image?
    
    func loadImage() {
        guard let selectedImage  = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
        
    }
    
    var body: some View {
        HStack {
            ScrollView (.horizontal){
                
                
                Button(action: {
                    showImagePicker.toggle()
                    
                }) {
                    ZStack{
                        KFImage(URL(string: collection.images[0]))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .clipped()
                        
                        
                        
                        Image(collection.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .clipped()
                        
                        
                        Image("collection1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .clipped()
                        
                        
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                                .clipped()
                            
                        } else {
                            
                        }
                    }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: $selectedUIImage)
                }
                
            }
        }
        .padding()
    }
}
struct EditCollectionmageView_Previews: PreviewProvider {
    static var previews: some View {
        EditProductImageView(product: Product(dictionary: ["images" : "collection1"]), images: .constant(["collection5"]), showImagePicker: .constant(false))
    }
}
