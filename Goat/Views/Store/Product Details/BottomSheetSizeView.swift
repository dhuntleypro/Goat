//
//  BottomSheetSizeView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct BottomSheetSizeView: View {
    @ObservedObject var cartVM = CartViewModel()

    @ObservedObject var productVM = ProductViewModel()
    @ObservedObject var collectionVM = CollectionViewModel()
    
    @Binding var selectedSize : String
    @Binding var selectedSizePrice : Float
    @Binding var isSwiped : Bool
    @Binding var offset : CGFloat


    //   @State var selectedSize = "S"
    //    @State var selectedSizePrice = ""
    
    
    @State var selected = 0
    
    @Binding var isOpen : Bool
    @Binding var lightBg : Bool
    
    @State var bgColor : Color
    
    var product : Product
    //  @State var sizes = ["XS", "S" , "M" , "L" , "XL" , "2XL" , "3XL" , "4XL"]
    //  @State var pricing = [0, 78 , 77 , 77 , 0 , 70 , 77, 71]
    @Binding var selected_Size : Bool
    //   @State private var selection = Set<String>()
    
    
    
    @State var isShown = true
    @Binding var setModalHeight : CGFloat
    @State var quantity : Int = 1
    @Binding var total : Float
    
    
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }

    var body: some View {
        //   BottomSheetView(isOpen: $isOpen, bgColor: bgColor, lightBg: $lightBg, maxHeight: 450) {
        HalfModalView(isShown: $isOpen, bgColor: .black, bgOpacityLevel: 1.0, dismissableBackground: false , modalHeight : setModalHeight) {
            VStack {
                
                if setModalHeight == 300 {
                    HStack {
                        Text(product.name)
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold, design: .rounded))
                        
                        Spacer()
                    }
                    .padding()
                    
//                    HStack {
//                        Text("Quantity").underline()
//                            .foregroundColor(.white)
//                            .font(.system(size: 19, weight: .bold, design: .rounded))
//                        
//                        Text("\(quantity)")
//                            .padding()
//                            .font(.system(size: 19, weight: .bold, design: .rounded))
//                            .clipShape(Circle())
//                            .foregroundColor(.white)
//                        
//                        
//                        Spacer()
//                        HStack {
//                            Button(action: {
//                                
//                            }) {
//                               Text(selectedSize)
//                                    .padding()
//                                    .foregroundColor(.black)
//                                    .background(Color.white)
//                                    .clipShape(Circle())
//                            }
//                            
//                            
//                        }
//                        Button(action: {
//                            cartVM.addToCart(product: product , selectedSize: selectedSize, selectedSizePrice: selectedSizePrice, quantity: quantity, offset : offset , isSwiped : isSwiped, total: total)
//                           
//                            setModalHeight = 100
//                        }) {
//                            Text("Add to Cart")
//                                .fontWeight(.bold)
//                                .foregroundColor(.black)
//                                .padding(.vertical, 10)
//                                .padding(.horizontal, 20)
//                                .background(Color.white)
//                                .cornerRadius(6)
//                        }
//                        
//                       
//                    }
                    .padding()
                    
                    
                    // Quanity
                    HStack {
                        
                        Button(action: {
                            quantity -= 1
                        }) {
                            Image(systemName: "minus.square.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                            
                        }
                        
                        Button(action: {
                            quantity += 1
                        }) {
                            Image(systemName: "plus.square.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                            
                        }
                        
                        
                        
                        Spacer()
                        Text("$\(selectedSizePrice * Float(quantity))")
                            .foregroundColor(.white)
                            .font(.system(size: 25 , weight: .bold))
                        
                    }
                    .padding()
                    
                }
                
                if setModalHeight != 300 {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 75){
                        
                        ForEach(Array(zip(product.size, product.sizePricing)), id: \.0) { item in
                            
                            Button(action: {
                                selectedSize = item.0
                                selectedSizePrice = item.1
                                
                                
                                print("size selected: \(selectedSize)")
                                print("item price: \(selectedSizePrice)")
                                
                                // offset half model
                                self.setModalHeight = 300
                                
                            }) {
                                VStack {
                                    
                                    Text("\(item.0)")
                                        .foregroundColor(selectedSize == item.0 ? .green : .white )
                                        .font(.system(size: 18, weight: .bold, design: .default))
                                    Text(getPrice(value: item.1))
                                        .foregroundColor(selectedSize == item.0 ? .green : .white )
                                        .font(.system(size: 15, weight: .bold, design: .rounded))
                                }
                            }
                        }
                    }
                    .padding(.top, 30)
                    .padding(.leading, 40)
                    
                }
                }
                
                Spacer()
            }
        }
    }
}

//struct BottomSheetSizeView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomSheetSizeView(isOpen: .constant(false), lightBg: .constant(false), bgColor: Color.black)
//    }
//}
