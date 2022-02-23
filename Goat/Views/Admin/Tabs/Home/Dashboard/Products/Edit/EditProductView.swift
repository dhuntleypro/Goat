//
//  EditProductView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Firebase
import Kingfisher

struct EditProductView: View {
    @ObservedObject private var collectionVM = CollectionViewModel()
    @ObservedObject var productVM = ProductViewModel()
    
    @Environment(\.presentationMode) var  presentationMode
    
    @State var showVariant = false
    @State var showSingleView = false
    @State var showTags = false
    @State var showAnalytics = false
    
    @State var updated = false
    @State var price_textField_val = ""
    
    // Passed Product values
    @State var id: String = ""
    @State var name : String = ""
    @State var description: String = ""
    @State var isAdded : Bool = false
    @State var cost : String = ""
    @State var likes : String = ""
    @State var taxed: Bool = false
    @State var variantItem : Bool = false
    @State var size: [String] = [""]
    @State var sizePricing :  [Float] = [0.0]
    @State var sizeQuantity : [Int] = [0]
    @State var quantity : String = ""
    @State var onSale: Bool = false
    @State var onSalePrice : String = ""
    @State var tags : [String]  = [""]
    @State var brand : String = ""
    @State var category : String = ""
    @State var sku : String = ""
    @State var mainColor : String = ""
    @State var want : Bool = false
    @State var releaseDate : String = ""
    @State var images : [String] = [""]
    @State var onAppImages: [String] = [""]
    @State var soldOut : Bool = false
    @State var active: Bool = false
    @State var lockPrice = false
    
    
    // filter products
    @State var condition = [String]()
    var compareData = [Product]()
    
    
    private func delayFetch() {
        // Delay of 2.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            productVM.fetchProducts()
            updated.toggle()
        }
    }
    
    // Which view is being presented and dismiss a screen
    //  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
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
    
    
    var product: Product
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView(.vertical) {
                    
                    // IMAGES
                    EditProductImageView(product: product, images: $images, showImagePicker: $showImagePicker)
                    
                    // TEXTFIELD
                    EditProductFieldItemsView(id: $id,
                                              name : $name,
                                              description: $description,
                                              isAdded : $isAdded,
                                              cost : $cost,
                                              likes : $likes,
                                              taxed: $taxed,
                                              variantItem : $variantItem,
                                              size: $size,
                                              sizePricing :  $sizePricing,
                                              sizeQuantity : $sizeQuantity,
                                              quantity : $quantity,
                                              onSale: $onSale,
                                              onSalePrice : $onSalePrice, // change to nsNumber
                                              tags : $tags,
                                              brand : $brand,
                                              category : $category,
                                              sku : $sku,
                                              mainColor : $mainColor,
                                              want : $want,
                                              releaseDate : $releaseDate,
                                              images : $images,
                                              onAppImages: $onAppImages,
                                              soldOut : $soldOut,
                                              active: $active,
                                              showVariant: $showVariant, showSingleView: $showSingleView,
                                              // showSingle: $showSingle,
                                              showTags: $showTags,
                                              product: product
                    )
                    
                    Spacer()
                    
                }
                .padding()
                
            }
            
            HalfModalView(isShown: $showTags, bgColor: .black, bgOpacityLevel: 1.0, dismissableBackground: false , modalHeight : 300) {
                
                TagView(product: product, tags: $tags)
            }
            
            
            HalfModalView(isShown: $showVariant, bgColor: .black, bgOpacityLevel: 1.0, dismissableBackground: false , modalHeight : 300) {
                
                VariantView(price_Textfield: $cost, lockPrice: $lockPrice, product: product)
            }
            
            HalfModalView(isShown: $showSingleView, bgColor: .black, bgOpacityLevel: 1.0, dismissableBackground: false , modalHeight : 300) {
                
                SingleItemView(price_Textfield: $cost, quantity: $quantity, onSale: $onSale, onSalePrice: $onSalePrice,  product: product)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Edit Product")
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
                        self.showAnalytics.toggle()
                    }) {
                        Text("See Analytics")
                            .modifier(myClearButton100BY35(bgColor: .black))
                        
                    }
                    .sheet(isPresented: $showAnalytics) {
                        ProductAnalyticsView(product: product)
                    }
                    
                    Button(action: {
                        print("DEBUG : NEED TO WRITE UPDATE CODE FOR PRODUCT")
                    
                        productVM.updateProduct(
                            id: id,
                            name : name,
                            description: description,
                            isAdded : isAdded,
                            cost : cost,
                            likes : likes,
                            taxed: taxed,
                            variantItem : variantItem,
                            size: size,
                            sizePricing :  sizePricing,
                            sizeQuantity :sizeQuantity,
                            quantity : quantity,
                            onSale: onSale,
                            onSalePrice : onSalePrice,
                            tags : tags,
                            brand : brand,
                            category : category,
                            sku : sku,
                            mainColor : mainColor,
                            want : want,
                            releaseDate : releaseDate,
                            images : images,
                            onAppImages: onAppImages,
                            soldOut : soldOut,
                            active: active
                            
                            
                            
                        )
                        //    }
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

