//
//  CreateCollectionView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Kingfisher
import Firebase
// import SPAlert

struct CreateCollectionView: View {
    
    @ObservedObject var globalVM = GlobalFirebaseViewModel()
    
    @ObservedObject var viewModel : UploadCollectionViewModel
    @ObservedObject var collectionVM = CollectionViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @Binding var isPresented : Bool
    
    
    @State var showVariant = false
    @State var nonVariant = false
    @State var showVarientSize = false
    @State var showCount = false

    
 
    
    
    // Images
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State private var images:[Identifiable_UIImage] = []
    //
    //
    
    // Create Collection
    @State var id: String = ""
    @State var title: String = ""
    @State var caption: String = ""
    @State var description: String = ""
    @State var passed_image: String = ""
    @State var amount : Int = 0
    @State var likes : Int = 0
    @State var onSale: Bool = false
    @State var sequenceCount : Int = 0
    @State var conditions : [String] = [""]
    
    let second = ["p"]
    
    
    @State var active: Bool = false
    
    
    @State var images2 : [String] =  ["https://firebasestorage.googleapis.com/v0/b/ecommerce-d88d7.appspot.com/o/product_Nv18qaWZv8XDoJfdJqVe_2?alt=media&token=0cb9dfd9-0d0a-4c41-bf8f-c808e58834ce"]
 
    
    @State var modalHeight : CGFloat = 400
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.viewModel = UploadCollectionViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        
        
    //    NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    Group {
                        
                        HStack {
                            Text("Create Collection")
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
                    
                    // (fix) change to signle image picker
                        CustomMultiImagePickerWindow(showSheet: $showSheet, showImagePicker: $showImagePicker, sourceType: $sourceType, images: $images, title: "")
                    
                }
                    Button(action: {
                        self.active.toggle()
                    }) {
                        Text(active ? "Active" : "Not Active")
                            .modifier(active ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                        
                    }
                    
                    TextField("Title", text: $title)
                        .frame(width: 300)
                        .padding(10)
                        .background(
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                            
                        )
                    
                    TextField("caption", text: $caption)
                        .frame(width: 380 , height: 100)
                        .padding(10)
                        .background(
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                            
                        )
                    
                   
                    
                    HStack {
                        VStack(spacing: 10) {
                            
                            Button(action: {
                                self.showCount.toggle()
                            }) {
                                Text( "Set Count" )
                                    .modifier( myClearButton100BY35(bgColor: .black)  )
                            }
                            
                            
                            Button(action: {
                                self.showVarientSize.toggle()
                            }) {
                                Text( "+ Tags" )
                                    .modifier( myClearButton100BY35(bgColor: .black))
                            }
                        }
                        
                      
                        
                        
                        Spacer()
                        
                        
                        
                        
                        
                    }
                    
                    
                    Spacer()
                    
                    Button(action: {
                        //
                        let docRef = COLLECTION_PRODUCT_COLLECTIONS.document()
                        
                        viewModel.uploadCollection(id: id, title: title, caption: caption, description: description, amount: amount, likes: likes, onSale: onSale, image: passed_image, images: images2, sequenceCount: sequenceCount, conditions: conditions, active: active)
                        
                        // upload images
                        if images.count > 0 {
                            for i in 0...self.images.count-1 {
                                let image = self.images[i].image
                                
                                globalVM.uploadImage("collection_\(docRef.documentID)_\(i)", image: image, docRef: docRef , completion: {_ in
                                    
                                    print("DEBUG3: ImageUR: ==> \(image)")
                                    
                                    // updates data of images adding strings
                                    //                            docRef.updateData([ "images": FieldValue.arrayUnion(["collection_\(docRef.documentID)_\(i)"])]) { _ in
                                    //
                                    //                              //  actionsCompleted += 1
                                    //                              //  check_success()
                                    //                            }
                                    
                                })
                            }
                            
                        }
                        collectionVM.fetchCollections()
                        
                        //                    docRef.updateData([ "images": FieldValue.arrayUnion([ "\(docRef.documentID)"])]) { _ in
                        //
                        //                      //  actionsCompleted += 1
                        //                      //  check_success()
                        //                    }
                        
                        
                        
                        //  addImagesToCollection()
                        
                        //  NewCreateCollection()
                        
                        
                        
                     
                        
                    }) {
                        HStack {
                            Spacer()
                            
                            Text("Create")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                        
                    }
                    .padding()
                    
                }
                .padding()
                
                
                
                
                HalfModalView(isShown: $showCount,  bgColor: .white, bgOpacityLevel: 1.0, dismissableBackground: true , modalHeight : 400) {
                    VStack {
                        Text("Set Sequence Count")
                            .bold()
                            .font(.title)
                            .padding(.top, 20)
                        
                        Text("This will determine the order in which your collection appears")
                            .font(.title3)
                            .foregroundColor(Color.gray)
                            .frame( height: 50)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)

                        
                        
                        Button(action: {
                            showCount.toggle()
                        }) {
                            Text("Select")
                                .modifier(myClearButton100BY35(bgColor: .black))

                        }
                        .padding()
                        
                        Spacer()
                        
                        Picker("Sequence Count", selection: $sequenceCount) {
                            ForEach(1 ..< 100) {
                                //  ForEach(collectionVM.collections) { collection in

                                // if collection.sequenceCount
                                Text("\($0)")
                            }
                            
                        }
                        .frame( height: 100)
                        .padding(.top, 25)
                       // .clipped()
                          
                        Spacer()
                        Spacer()

                    }
                    .padding()
                }
                    
                    
                     
                    
                HalfModalView(isShown: $showVarientSize ,  bgColor: .white, bgOpacityLevel: 1.0, dismissableBackground: true, modalHeight : 400) {
                    VStack {
                        
                        HStack{
                            TextField("Title ex. Featured", text: $title)
                                .frame(width: 300)
                                .padding(10)
                                .font(.system(size: 30 , weight: .bold))
                            
                            
                            Spacer()
                        }
                        Text("Product tag is equal to ...")
                            .bold()
                            .font(.title3)
                        
                     

                        Button(action: {
                            conditions.append("i")
                            //  conditions[idx] += second[idx]
                            
                            print("DEBUG : array added to codition")
                            print("DEBUG : condition ==> \(conditions)")
                            
                        }) {
                            Image(systemName: "plus")
                        }
                        
                        
                        ForEach(0..<conditions.count){ idx in
                            VStack {
                                HStack {
                                    TextField(conditions[idx], text: $conditions[idx])
                                        .frame(width: 300)
                                        .padding(10)
                                        .background(
                                            Rectangle()
                                                .cornerRadius(10)
                                                .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                                            
                                        )
                                    
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                        Spacer()
                        
                    }
                    //                    CreateSizeVariantView(newItem_type: $newItem_type, collectionSizeUnit_index: $collectionSizeUnit_index, lockPrice: $lockPrice, price_Textfield: $halfModal_textField1_val, sizeType1: $sizeType1, sizeType2: $sizeType2, sizeType3: $sizeType3, showModify: $showModify, halfModal_shown: $halfModal_shown, newCollection: $newCollection, showSheet: $showSheet, showImagePicker: $showImagePicker, sourceType: $sourceType, images: $images)
                    
                    
                }
                
                
            }
            .frame(width: UIScreen.main.bounds.width)
         //   .navigationBarHidden(true)
            
     //   }
        
        
        
    }
    func possible_stringToDouble(_ stringToValidate:String) -> Double?{
        let val:Double? = Double(stringToValidate) ?? nil
        
        if let val = val {
            return val
        } else {
            return nil
        }
        
    }
    
    
    func addImagesToCollection() {
        
        // upload images
        for i in 0...self.images.count-1 {
            let image = self.images[i].image
            viewModel.uploadImage("recipe_\(images)_\(i)", image: image, completion: {_ in
                
                //  user.publishedCollections.append(thisCollection.id.uuidString)
                
                COLLECTION_MEDIA.document().updateData([ "images": FieldValue.arrayUnion(["\(image)"])] ) { _ in
                    
                    
                }
                //    actionsCompleted += 1
                //   check_success()
                
            })
        }
    }
}

struct CreateCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCollectionView(isPresented: .constant(false))
    }
}
