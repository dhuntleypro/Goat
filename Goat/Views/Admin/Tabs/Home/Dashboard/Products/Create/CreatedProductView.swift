//
//  SubmitCreatedProductView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Firebase


struct CreatedProductView: View {
    @ObservedObject var viewModel : UploadProductViewModel
    @ObservedObject var globalVM = GlobalFirebaseViewModel()
    
    //
    @Binding var name : String
    @Binding var description: String
    @Binding var isAdded : Bool
    @Binding var cost : Float
    @Binding var likes : Int
    @Binding var taxed: Bool
    @Binding var variantItem : Bool
    @Binding var size: [String]
    @Binding var sizePricing :  [Float]
    @Binding var sizeQuantity :[Int]
    @Binding var quantity : Int
    @Binding var onSale: Bool
    @Binding var onSalePrice : Float
    @Binding var tags : [String]
    @Binding var brand : String
    @Binding var category : String
    @Binding var sku : String
    @Binding var mainColor : String
    @Binding var want : Bool
    @Binding var releaseDate : String
    @Binding var onAppImages: [String]
   // @Binding var uploadedimages : [Identifiable_UIImage]
    @Binding var soldOut : Bool
    @Binding var active: Bool

    
    @Binding var price_Textfield : String
    // Images
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    
    
    // Image
    @Binding  var images : [Identifiable_UIImage]
    
    // Sizes
  //  @Binding  var productSize : [ProductSize]

    var body: some View {
        
        
        
        
        
        VStack {
            
//            Button(action: {
//              //  print("DEBUG productSize ==> \(productSize)")
//            }) {
//                Text("Check size array L2")
//            }
            
            Button(action: {

           //     add_SizesXTOL(price_Textfield: price_Textfield)
             //   print("DEBUG: productSize ==> \(productSize)")
                let docRef = COLLECTION_PRODUCTS.document()
                
              
          //      let docID = docRef.documentID
                
                viewModel.uploadProduct(id: docRef.documentID,
                                        name : name,
                                        description: description,
                                        isAdded : isAdded,
                                        cost :  cost,
                                        likes :  likes,
                                        taxed:  taxed,
                                        variantItem :  variantItem,
                                        size:  size,
                                        sizePricing :   sizePricing,
                                        sizeQuantity :  sizeQuantity,
                                        quantity : quantity ,
                                        onSale:  onSale,
                                        onSalePrice :  onSalePrice,
                                        tags :  tags,
                                        brand :  brand,
                                        category :  category,
                                        sku :  sku,
                                        mainColor :  mainColor,
                                        want :  want,
                                        releaseDate :  releaseDate,
                                        onAppImages:  onAppImages,
                                        images: [],
                                        soldOut :  soldOut,
                                        active:  active
                
                )
                
             
                // ADD SIZE VARANTS
                
                // productSizes = self.productSizes.formatForFirebase()
//                if productSize.count > 0 {
//                    for i in 0...self.productSize.count-1 {
//                        let productSizeVV = productSize
//
//                        let name = self.productSize[i].name
//                        let amount = self.productSize[i].amount
//                        let amountUnit = self.productSize[i].amountUnit
//
//
//                        globalVM.uploadSize("product_\(docRef.documentID)_\(i)", size: productSizeVV, name: name, amount: amount, amountUnit: amountUnit , docRef: docRef , completion: {_ in
//                        })
//                    }
//
//
//                }
              //  let sizesdata = ["sizeCoverted" : productSize.formatForFirebase() ]
//
//                docRef.setData(sizesdata, merge: true) { _ in
//                    print("DeBug2 : sizesdata ")
//                }
//
                
                
                
               //  UPLOAD IMAGES
                if images.count > 0 {
                    for i in 0...self.images.count-1 {
                        let image = self.images[i].image
                            
                        
                        //  UPLOAD IMAGES TO STORAGE
                        globalVM.uploadImage("product_\(docRef.documentID)_\(i)", image: image, docRef: docRef , completion: {_ in

                            print("DEBUG333: ImageUR: ==> \([image])")
                         //   docRef.setData(["images": FieldValue.arrayUnion([image])])
                        })
                        
                        // cause crash
//                        docRef.setData(["images": FieldValue.arrayUnion([image])]) { _ in
//
//                        }

                        // NOOOOOO
//                        // UPDATE IMAGE DATEBASE
                        
                    }
                }
                
              //  print("DEBUG2 3 productSize ==> \(productSize)")

                
            }) {
                Text("Submit")
            }
          //  .disabled(agreedToTerms == false)
        }
    }
}

//struct SubmitCreatedProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubmitCreatedProductView()
//    }
//}
