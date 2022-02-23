//
//  CustomImagePickerWindow.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Kingfisher

struct CustomImagePickerWindow: View {
    
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image : Image?
    
    func loadImage() {
        guard let selectedImage  = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
        
    }

    
    var body: some View {
        VStack {
            Button(action: {
                showImagePicker.toggle()
            }, label: {
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipped()
                            .cornerRadius(70)
                            .padding(.top, 88)
                            .padding(.bottom, 16)
                            
                    } else {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .padding(.top, 88)
                        .padding(.bottom, 16)
                        .foregroundColor(.white)
                    }
                }
                
                
            })
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $selectedUIImage)
            }
            
        }
    }
}

//struct CustomImagePickerWindow_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomImagePickerWindow()
//    }
//}
