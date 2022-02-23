//
//  CreateProductView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct CreateProductView: View {
    
    
    @ObservedObject var viewModel : UploadProductViewModel
    @Environment(\.presentationMode) var presentationMode

    
    
    @Binding var isPresented : Bool
    
    // IMAGE
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State  var images: [Identifiable_UIImage] = []
    
    // SIZES
   // @State  var productSize : [ProductSize] = []
    
    
    
    @State var sizeType1 = false
    @State var sizeType2 = false
    @State var sizeType3 = false
    @State var lockPrice = false
    @State var price_Textfield = ""
    @State var productSizeUnit_index = 0
    
    @State var showVariantSize = false
    @State var showVariant = false
    @State var nonVariant = false
    @State var showTags = false
    
    
    // Create Product
    @State var id: String = ""
    @State var name : String = ""
    @State var description: String = ""
    @State var isAdded : Bool = false
    @State var cost : Float = 0.0
    @State var likes : Int = 0
    @State var taxed: Bool = false
    @State var variantItem : Bool = false
    @State var size: [String] = [""]
    @State var sizePricing :  [Float] = [0.0]
    @State var sizeQuantity :[Int] = [0]
    @State var quantity : Int = 0
    @State var onSale: Bool = false
    @State var onSalePrice : Float = 0.0 // change to nsNumber
    @State var tags : [String]  = [""]
    @State var brand : String = ""
    @State var category : String = ""
    @State var sku : String = ""
    @State var mainColor : String = ""
    @State var want : Bool = false
    @State var releaseDate : String = ""
 //   @State var uploadedimages : [String] = [""]
    @State var onAppImages: [String] = [""]
    @State var soldOut : Bool = false
    @State var active: Bool = false

    
    
    
    @State var modalHeight : CGFloat = 350
    // dismiss view on completion of new product being added
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadProductViewModel(isPresented: isPresented)
    }
   
    var body: some View {
        NavigationView{
            
            ZStack {
                ScrollView {
                    VStack {
                        Spacer().frame(height: 25)
                        
                        // TITLE
                        HStack {
                            Text("Create Product")
                                .font(.title2)
                                .bold()
                                .padding(.leading)
                            Spacer()
                            Button(action: {

                            presentationMode.wrappedValue.dismiss()

                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .padding(.trailing)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        .padding(.vertical)
                        
                         
                        // IMAGES
                        CustomMultiImagePickerWindow(showSheet: $showSheet, showImagePicker: $showImagePicker, sourceType: $sourceType, images: $images, title: ""
                        )
                        
                        // TEXTFIELD
                        ProductFieldItemsView(
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
                            quantity : $quantity ,
                            onSale: $onSale,
                            onSalePrice : $onSalePrice,
                            tags : $tags,
                            brand : $brand,
                            category : $category,
                            sku : $sku,
                            mainColor : $mainColor,
                            want : $want,
                            releaseDate : $releaseDate,
                            onAppImages: $onAppImages,
                            // uploadedimages: Binding<[Identifiable_UIImage]>,
                         //   images: $images,
                            soldOut : $soldOut,
                            active: $active, showVariantSize: $showVariantSize, showVariant : $showVariant, nonVariant: $nonVariant, showTags: $showTags
                                              
                        )
                        
                        // SUBMIT BUTTON
                        CreatedProductView(viewModel: viewModel,
                                           
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
                                                onSalePrice : $onSalePrice,
                                                tags : $tags,
                                                brand : $brand,
                                                category : $category,
                                                sku : $sku,
                                                mainColor : $mainColor,
                                                want : $want,
                                                releaseDate : $releaseDate,
                                                onAppImages: $onAppImages,
//                                                uploadedimages : $
                                                soldOut : $soldOut,
                                                active: $active,
                        
                                                 price_Textfield: $price_Textfield,
                                                 images: $images
                                              //   productSize: $productSize
                                                
                                                 
                                                 
                        )
                      
//                        ScrollView(.horizontal){
//                            HStack {
//                                ForEach (productSize) { size in
//                                    VStack {
//                                        Text("ww")
//                                        Text(size.amountUnit.rawValue)
//                                            .foregroundColor(.black)
//
//                                        Text("$\(size.amount.stringWithoutZeroFraction)")
//                                            .foregroundColor(.init(red: 0.3, green: 0.3, blue: 0.3))
//                                    }
//                                    .padding()
//                                    .frame(width: 75)
//                                    .background(Color.init(red: 0.85, green: 0.85, blue: 0.85))
//                                    .cornerRadius(5)
//                                }
//                            }
//                        }
                        
                        Spacer()
                    }
                }
                
                HalfModalView(isShown: $showVariantSize,  bgColor: .white, bgOpacityLevel: 1.0, dismissableBackground: true, modalHeight : 350 ) {
                    
                    Text("ff")
                    
                 // CreateSizeVariantView(sizeType1: $sizeType1, sizeType2: $sizeType2, sizeType3: $sizeType3, price_Textfield: $price_Textfield, lockPrice: $lockPrice, productSizeUnit_index: $productSizeUnit_index
    // newProduct: newProduct , newProductSize : size )
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
}

//struct CreateProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateProductView()
//    }
//}
