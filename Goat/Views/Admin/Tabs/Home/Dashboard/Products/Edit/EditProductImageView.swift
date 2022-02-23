//
//  EditProductImageView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Kingfisher


struct EditProductImageView: View {
    @ObservedObject var productVM = ProductViewModel()
    
    var product : Product
    
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
                        KFImage(URL(string: product.images[0]))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .clipped()
                        
                        
                        
                        Image(product.onAppImages[0])
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
    }
}

struct EditProductImageView_Previews: PreviewProvider {
    static var previews: some View {
        EditProductImageView(product: Product(dictionary: ["String" : "Any"]), images: .constant(["fff"]), showImagePicker: .constant(false))
    }
}
