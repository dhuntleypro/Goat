//
//  EditProductFieldItemsView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct EditProductFieldItemsView: View {
    @ObservedObject var productVM = ProductViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var id: String
    @Binding var name : String
    @Binding var description: String
    @Binding var isAdded : Bool
    @Binding var cost :  String
    @Binding var likes : String
    @Binding var taxed: Bool
    @Binding var variantItem : Bool
    @Binding var size: [String]
    @Binding var sizePricing :  [Float]
    @Binding var sizeQuantity :[Int]
    @Binding var quantity : String
    @Binding var onSale: Bool
    @Binding var onSalePrice : String
    @Binding var tags : [String]
    @Binding var brand : String
    @Binding var category : String
    @Binding var sku : String
    @Binding var mainColor : String
    @Binding var want : Bool
    @Binding var releaseDate : String
    @Binding var images : [String]
    @Binding var onAppImages: [String]
    @Binding var soldOut : Bool
    @Binding var active: Bool
    
    @Binding var showVariant : Bool
    @Binding var showSingleView : Bool
    @Binding var showTags : Bool
    
    
    @State var lockPrice = false
    @State var singleItem = true
    @State var previewProduct = false
    
    var product : Product
    var body: some View {
        VStack {
            
            
            
            
            //            var variantItem : Bool
            //            var size: [String]
            //            var sizeType : Int
            //            var sizePricing :  [Float]
            //            var sizeQuantity :[Int]
            
            
            //            var tags : [String]
            //            var brand : String
            //            var category : String
            //            var sku : String
            //            var mainColor : String
            //            var want : Bool
            //            var releaseDate : String
            //            var images : [String]
            //            var onAppImages: [String]
            //            var soldOut : Bool
            //            var row : Int
            
            HStack {
                Button(action: {
                    self.active.toggle()
                }) {
                    Text(active ? "Active" : "Not Active")
                        .modifier(active ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                    
                }
                
                Button(action: {
                    self.previewProduct.toggle()
                }) {
                    Text("Preview")
                        .modifier(myClearButton100BY35(bgColor: .black))
                    
                }
                .sheet(isPresented: $previewProduct ) {
                    ScrollView (.vertical) {
                        VStack(spacing:25) {
                            
                            Spacer().frame(height: 200)
                            
                            HStack {
                                
                                LazyVGrid(columns: columns3 , spacing: 0) {
                                    Spacer().frame(width: UIScreen.main.bounds.width / 2)
                                    
                                    ProductCell02(product: product)
                                }
                                
                            }
                            
                            ProductCell00(product: product)
                            
                            ProductCell01(product: product)
                            
                           
                            
                            Spacer().frame(height: 200)
                            
                        }
                    }
                }
                
                Spacer()
                
                Text("$\(Double(product.cost).cleanCurrency)")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black)
                    .padding(.trailing)
            }
            
            
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    VStack(alignment: .leading) {
                        
                        Text("Name")
                            .bold()
                            .foregroundColor(.black)
                            .padding(.top)
                        
                        TextField("Name", text: $name)
                            .modifier(GrayBackground())
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Description")
                            .bold()
                            .foregroundColor(.black)
                        
                        MultiLineTextField(placeholderText: "description", text: $description)
                            .modifier(GrayBackgroundLarge())
                        
                        // Spacer()
                    }
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text("Likes")
                                .bold()
                                .foregroundColor(.black)
                            
                            TextField("Likes", text: $likes)
                                .modifier(GrayBackgroundSmall())
                        }
                        
                        Spacer()
                    }
                    
                    
                    Button(action: {
                        self.taxed.toggle()
                    }) {
                        Text(taxed ? "Taxed" : "Not Taxed")
                            .modifier(taxed ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                    }
                    
                    
                    
                    VStack(alignment: .leading, spacing : 15 ) {
                        
                        Text("Item Type")
                            .foregroundColor(.black)
                            .bold()
                        
                        HStack {
                            Button(action: {
                                self.showVariant = false
                                self.showSingleView.toggle()
                            }) {
                                Text("Single Item")
                                    .modifier(showSingleView ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                            }
                            
                            Button(action: {
                                self.showVariant.toggle()
                                self.showSingleView = false
                            }) {
                                Text("+ Variant Item")
                                    .modifier(showVariant ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                            }
                        }
                        
                        
                        
                        
                        
                        // Tag
                        Text("Tags")
                            .foregroundColor(.black)
                            .bold()
                        
                        Button(action: {
                            
                            self.showTags.toggle()
                            
                        }) {
                            Text("+ Tags")
                                .modifier(myClearButton100BY35(bgColor: .black))
                        }
                        
                        //                            ForEach(product.tags , id : /.self) { tag in
                        //                                 Text(tag)
                        //                            }
                        
                        
                        Group {
                            
                            if onSale == true {
                                VStack(alignment: .leading , spacing : 10) {
                                    Text("Sale Price")
                                        .bold()
                                        .foregroundColor(colorScheme == .dark ? Color(.gray) : Color(.gray))
                                    
                                    HStack(spacing : 10) {
                                        HStack(spacing: 1) {
                                            Text("$")
                                            TextField("sale price", text: $onSalePrice)
                                                .keyboardType(.numberPad)
                                        }
                                        .modifier(GrayBackgroundSmall())
                                        
                                        HStack(spacing : 1) {
                                            Text("$")
                                            Text(cost).strikethrough()
                                        }
                                        .foregroundColor(.red)
                                    }
                                }
                            } else {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Price")
                                            .bold()
                                            .foregroundColor(Color.black)
                                        
                                        HStack(spacing : 0) {
                                            Text("$")
                                            TextField("price", text: $cost) // $cost
                                                //   Text("$\(Double(product.cost).cleanCurrency)")
                                                .keyboardType(.numberPad)
                                            
                                        }
                                        .modifier(GrayBackgroundSmall())
                                        .foregroundColor(.black)
                                    }
                                    
                                    //      VStack(alignment: .leading) {
                                    
                                    //
                                    //                                            HStack(spacing : 0) {
                                    //
                                    //                                              TextField("price", text: $sizeQuantity[0])
                                    //                                                    .keyboardType(.numberPad)
                                    //
                                    //                                            }
                                    //                                            .modifier(GrayBackgroundSmall())
                                    //                                            .foregroundColor(.black)
                                    
                                    //    }
                                }
                                
                            }
                        }
                        
                        //
                        //                            Button(action: {
                        //                                self.onSale.toggle()
                        //                            }) {
                        //                                Text(onSale ? "On Sale" : "No Sale")
                        //                                    .modifier(onSale ? myClearButton100BY35(bgColor: .black) :  myClearButton100BY35(bgColor: .gray) )
                        //                            }
                        //
                        //
                        
                    }
                    Group {
                        
                        VStack(alignment : .leading , spacing : 16) {
                            Text("Brand")
                                .bold()
                                .foregroundColor(Color.black)
                            
                            TextField("Brand", text: $brand)
                                .modifier(GrayBackground())
                            
                            
                            
                            Text("Category")
                                .bold()
                                .foregroundColor(Color.black)
                            
                            TextField("Brand", text: $category)
                                .modifier(GrayBackground())
                            
                            
                            Text("Sku")
                                .bold()
                                .foregroundColor(Color.black)
                            
                            TextField("sku", text: $sku)
                                .modifier(GrayBackground())
                            
                            
                            Text("Main Color")
                                .bold()
                                .foregroundColor(Color.black)
                            
                            TextField("Main Color", text: $mainColor)
                                .modifier(GrayBackground())
                            
                            
                            
                            Text("ReleaseDate")
                                .bold()
                                .foregroundColor(Color.black)
                            
                            TextField("releaseDate", text: $releaseDate)
                                .modifier(GrayBackground())
                        }
                    }
                }
            }
        }
    }
}

//
//struct EditProductFieldItemsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProductFieldItemsView(id: .constant(""), name: .constant(""), description: .constant(""), isAdded: .constant(false), cost: .constant(""), likes: .constant(0), taxed: .constant(false), variantItem: .constant(false), size: .constant([""]), sizePricing: .constant([0]), sizeQuantity: .constant([0]), onSale: .constant(false), onSalePrice: .constant(""), tags: .constant([""]), brand: .constant(""), category: .constant(""), sku: .constant(""), mainColor: .constant(""), want: .constant(false), releaseDate: .constant(""), images: .constant([""]), onAppImages: .constant([""]), soldOut: .constant(false), active: .constant(false), showVariant: .constant(false), showSingleView: .constant(false), product: Product(dictionary: ["String" : "Any"]))
//    }
//}
