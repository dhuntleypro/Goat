//
//  EditCollectionView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/9/21.
//


import SwiftUI
import Firebase
import Kingfisher

struct EditCollectionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject private var collectionVM = CollectionViewModel()
    @ObservedObject var productVM = ProductViewModel()
    
    var collection : Collection
    
    @State var showCondition = false
    @State var updated = false
    @State var price_textField_val = ""
    
    // Passed Collection values
    @State var id: String = ""
    @State var title: String = ""
    @State var caption: String = ""
    @State var description: String = ""
    @State var amount: String = ""
    @State var likes: Int = 0
    @State var onSale: Bool = false
    @State var images: [String] = [""]
    @State var sequenceCount: Int = 0
    @State var conditions: [String] = [""]
    @State var active: Bool = false
    
    
    
    // filter collections
    @State var condition = [String]()
    // var compareData = [Product]()
    @State var conditiondata = ""
    @State var tagName = ""
    
    private func delayFetch() {
        // Delay of 2.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            collectionVM.fetchCollections()
            updated.toggle()
        }
    }
    
    // Which view is being presented and dismiss a screen
    
    @State var selectedUIImage: UIImage?
    @State var image : Image?
    
    
    
    
    // IMAGE
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    
    
    func loadImage() {
        guard let selectedImage  = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                ScrollView(.vertical) {
                    
                    // IMAGES
                    EditCollectionImageView(collection: collection, images: $images, showImagePicker: $showImagePicker)
                    
                    // TEXTFIELD
                    EditCollectionFieldItemsView(
                        id: $id,
                        title: $title,
                        caption: $caption,
                        description: $description,
                        amount: $amount,
                        likes: $likes,
                        onSale: $onSale,
                        images: $images,
                        sequenceCount: $sequenceCount,
                        conditions: $conditions,
                        active: $active,
                        showCondition: $showCondition
                    )
                    //
                    VStack {
                        
                        Text("Related Products")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                        
                        
                        ForEach(productVM.products){ product in
                            
                            ForEach(product.tags,id:\.self){ tagName in
                                //  if condition.count != 0 {
                                ForEach(condition,id:\.self) { conditiondata in
                                    if conditiondata == tagName {
                                        
                                        RelatedProductsCell(product: product)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            HalfModalView(isShown: $showCondition, bgColor: .black, bgOpacityLevel: 1.0, dismissableBackground: false , modalHeight : 300) {
                
                VStack {
                    
                    Text("fffff")
                }
                .foregroundColor(.white)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Edit Collection")
        .navigationBarItems(
            leading:
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    
                }, label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                        .font(.system(size: 20 ))
                })
            , trailing:
                HStack {
                    
                    Button(action: {
                        
                    } ) {
                        Text("Button")
                    }
                    
                    Button(action: {
                        
                        collectionVM.updateCollection(
                            id: id,
                            title: title,
                            caption: caption,
                            description: description,
                            amount: amount,
                            likes: likes,
                            onSale: onSale,
                            images: images,
                            sequenceCount: sequenceCount,
                            conditions: conditions,
                            active: active
                        )
                        
                        updated.toggle()
                        delayFetch()
                        
                    }) {
                        Text(updated ? "Updated" : "Update")
                            .modifier(updated ? myFillButton60BY35(bgColor: .gray, txtColor: .black) :  myFillButton60BY35(bgColor: .black, txtColor: .white))
                    }
                    
                    
                }
                
        )
        
        
    }
}



struct EditCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        EditCollectionView(collection: Collection(dictionary: ["images" : "collection1"]))
    }
}
