//
//  VariantView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/20/21.
//

import SwiftUI

struct VariantView: View {
    @ObservedObject var productVM = ProductViewModel()
    
    @Binding var price_Textfield : String
    @Binding var lockPrice : Bool
    
    @State var sizeTypes = ["XS-4XL" , "30 - 45" , "Manual" ]
    
    var product : Product
    var body: some View {
        
        VStack {
            
            
            Rectangle()
                .frame(width: 60, height: 5)
                .foregroundColor(.gray)
                .cornerRadius(10)
                .padding()
            
            HStack {
                Text("Size type")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    
                    // add_newSizeGroupXTOL(price_Textfield: price_Textfield)
                    
                }) {
                    Text("Build")
                        .modifier( price_Textfield != "" ? myWhiteToGreenButtonMid(green: true) : myWhiteToGreenButtonMid(green: false))
                }
            }
            
            
            HStack {
                
                if product.sizeType == 0 {
                    Text("Select a size type ")
                        .foregroundColor(.gray)
                } else if price_Textfield == "" {
                    Text("Enter Price ")
                        .foregroundColor(.gray)
                } else {
                    
                }
                
                Spacer()
            }
            
            HStack {
                ForEach(sizeTypes , id: \.self) { size in
                    //    ForEach(Array(zip(sizeTypes)), id: \.0) { item in
                    
                    
                    Button(action: {
                     //   self.product.sizeType == 1
                    //    selectedSize = item.0
                   //     selectedSizePrice = item.1
                    }) {
                        Text(size)
                    }
                    .modifier(myWhiteToBlackButtonMid(black: true))
                }
                
                Spacer()
            }
            .padding(.vertical)
            
            
            HStack{
                //if self.newItem_type == .ProductSize {
                HStack {
                    HStack {
                        Text("$")
                        TextField("", text: $price_Textfield)
                            .keyboardType(.numberPad)
                        
                    }
                    .modifier(GrayBackgroundSmall())
                    
                    
                    Button(action: {
                        self.lockPrice.toggle()
                    }) {
                        Image(systemName: lockPrice ? "lock.open" : "lock")
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                //   }
                
                //   if self.newItem_type == .ProductSize &&
                //    if sizeType3 == true {
                //                        Picker(selection: self.$productSizeUnit_index, label: Text("Unit")){
                //                            ForEach(0..<ProductSizeUnit.allCases.count){
                //
                //                                Text(ProductSizeUnit.allCases[$0].rawValue).tag($0)
                //
                //                            }
                //                        }
                //   .labelsHidden()
                //  .frame(width: 200, height:90)
                //   .clipped()
                // .padding()
                
                //    }
                
            }
            
            ScrollView(.horizontal){
                //                    HStack {
                //                        ForEach (productSize) { size in
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
                //                        }
                //                    }
            }
            
        }
        .padding(.horizontal)
    }
    
    func add_newSizeGroupXTOL(price_Textfield : String ) {
        
        
        // price
//        if price_Textfield == "" {
//                let alertView = SPAlertView(title: newItem_type == .ProductColor ? "Please add a productColor" : "Please add Pricing", message: "Make sure no textfields are left blank", preset: SPAlertIconPreset.error)
//             alertView.duration = 3 (fix) - not working
//               alertView.present()
//        }  else if let amount = possible_stringToDouble(price_Textfield) {
            
            //   let thisProductSizeUnit = ProductSizeUnit.allCases[productSizeUnit_index]
            
         //   let sizes = ["XS" , "S" , "M" , "L" , "XL" , "2XL" , "3XL" , "4XL"]
            
            
            //  productSize.append(ProductSize(name: "yoo1", amount: 33, amountUnit: .extraSmall))
            //   productSize.append(ProductSize(name: "yoo1", amount: 35, amountUnit: .small))
            //
            //
            //            productSize.append(ProductSize(dictionary: ["name" : sizes[0],
            //                                                        "amount" : amount,
            //                                                        "amountUnit" : ProductSizeUnit(rawValue: "XS")!
            //            ]))
            //
            //            productSize.append(ProductSize(dictionary: ["name" : sizes[1],
            //                                                        "amount" : amount,
            //                                                        "amountUnit" : ProductSizeUnit(rawValue: "S")!
            //            ]))
            //
            //            productSize.append(ProductSize(dictionary: ["name" : sizes[2],
            //                                                        "amount" : amount,
            //                                                        "amountUnit" : ProductSizeUnit(rawValue: "M")!
            //            ]))
            //
            //            productSize.append(ProductSize(dictionary: ["name" : sizes[3],
            //                                                        "amount" : amount,
            //                                                        "amountUnit" : ProductSizeUnit(rawValue: "L")!
            //            ]))
            //
            //            productSize.append(ProductSize(dictionary: ["name" : sizes[4],
            //                                                        "amount" : amount,
            //                                                        "amountUnit" : ProductSizeUnit(rawValue: "XL")!
            //            ]))
            //
            //            productSize.append(ProductSize(dictionary: ["name" : sizes[5],
            //                                                        "amount" : amount,
            //                                                        "amountUnit" : ProductSizeUnit(rawValue: "2XL")!
            //            ]))
            //
            //
            //            productSize.append(ProductSize(dictionary: ["name" : sizes[6],
            //                                                        "amount" : amount,
            //                                                        "amountUnit" : ProductSizeUnit(rawValue: "3XL")!
            //            ]))
            //
            //            productSize.append(ProductSize(dictionary: ["name" : sizes[7],
            //                                                        "amount" : amount,
            //                                                        "amountUnit" : ProductSizeUnit(rawValue: "4XL")!
            //            ]))
            
            
            //    print("DEBUG: productSize -- \(productSize)")
            
            
//        }
    }
}

struct VariantView_Previews: PreviewProvider {
    static var previews: some View {
        VariantView(price_Textfield: .constant(""), lockPrice: .constant(false), product: Product(dictionary: ["String" : "Any"]))
    }
}
