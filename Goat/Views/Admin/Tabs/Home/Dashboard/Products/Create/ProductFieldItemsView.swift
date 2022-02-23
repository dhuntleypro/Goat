//
//  ProductFieldItemsView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct ProductFieldItemsView: View {
    
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
    //   @Binding var uploadedimages : [Identifiable_UIImage]
    @Binding var soldOut : Bool
    @Binding var active: Bool
    
    
    //   @Binding var sizeConverted : [[String: Any]]
    
    //  @Binding var imagesCoverted : [String]
    
    
    // Variant Button
    @Binding var showVariantSize: Bool
    @Binding var showVariant : Bool
    @Binding var nonVariant: Bool
    @Binding var showTags: Bool
    
    // Size
    //   @Binding  var productSize : [ProductSize]
    
    @State var sizeType1 = false
    @State var sizeType2 = false
    @State var sizeType3 = false
    @State var lockPrice = false
    @State var price_Textfield = ""
    @State var productSizeUnit_index = 0
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                
                Button(action: {
                    self.active.toggle()
                }) {
                    Text(active ? "Active" : "Not Active")
                        .modifier(active ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                    
                }
                
                TextField("Name", text: $name)
                    .modifier(GrayBackground())
                
                
                MultiLineTextField(placeholderText: "description", text: $description)
                    .modifier(GrayBackgroundLarge())
                
                
                HStack {
                    
                    VStack(spacing: 10) {
                        
                        Button(action: {
                            self.showVariant.toggle()
                        }) {
                            Text(nonVariant ?  "Single Item" : "+ Variant" )
                                .modifier(taxed ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .black) )
                        }
                        .actionSheet(isPresented: $showVariant){
                            ActionSheet(title: Text("Select Varient"), message: nil, buttons: [
                                .default(Text("Single Item"), action: {
                                    self.nonVariant = true
                                    
                                }),
                                .default(Text("Size"), action: {
                                    self.showVariantSize = true
                                    //  newItem_type = .ProductSize
                                }),
                                .default(Text("Color"), action: {
                                    //   self.showVarientColor = true
                                    //   newItem_type = .ProductColor
                                }),
                                .cancel()
                                
                            ])
                        }
                        
                        Button(action: {
                            self.showTags.toggle()
                        }) {
                            Text("+ Tags")
                                .modifier(myClearButton100BY35(bgColor: .black) )
                        }
                        
                        
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        taxed.toggle()
                        print("tax\(taxed)")
                    }) {
                        Text(taxed ?  "Tax applied" : "Not Taxed" )
                            .modifier(taxed ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                    }
                    
                    
                    Button(action: {
                        onSale.toggle()
                    }) {
                        Text(onSale ? "On Sale" : "No Sale")
                            .modifier(onSale ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                    }
                    
                    
                    
                }
                
                if nonVariant == true {
                    TextField("price", text: $name)
                        .frame(width: 300)
                        .padding(10)
                        .background(
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                            
                        )
                    
                    
                }
                
                //            ScrollView(.horizontal){
                //                HStack {
                //                    ForEach (productSize) { size in
                //                        Button(action: {}) {
                //
                //
                //                            VStack {
                //                                Text(size.amountUnit.rawValue)
                //                                    .foregroundColor(.black)
                //
                //                                Text("$\(size.amount.stringWithoutZeroFraction)")
                //                                    .foregroundColor(.init(red: 0.3, green: 0.3, blue: 0.3))
                //                            }
                //                            .padding()
                //                            .frame(width: 75)
                //                            .background(Color.init(red: 0.85, green: 0.85, blue: 0.85))
                //                            .cornerRadius(5)
                //                            }
                //                    }
                //                }
                //            }
            }
            .padding()
            
            
            
            
        }
    }
}

//struct ProductFieldItemsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductFieldItemsView()
//    }
//}
