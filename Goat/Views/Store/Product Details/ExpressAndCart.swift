//
//  ExpressAndCart.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI


struct ExpressAndCart: View {
    @EnvironmentObject var auth: AuthViewModel
    
    @ObservedObject var cartVM = CartViewModel()
    @ObservedObject var productVM = ProductViewModel()
    
    
    @State var demoButtonClicked = false
    @State var buildButtonClicked = false
    
    @State var selected_Size : Bool = false
    
    
    @State var quanity = 1
    @State var price = 0.0
    //  let product: Product
    @ObservedObject var viewModel : ProductActionViewModel
    
    
    @State var expressCheckOut = false
    
    
    // @State private var showAlert = false
    @State private var showLogin = false // (fix make changable toggle on admin side )
    @State private var openRegistration = false
    
    
    @State var itemAdded = false
    @State private var addItemToCartAlert = false
    @State private var ItemAddedToCartAlert = false
    
    
    
    //    let colors: [Color] = [.red, .green, .blue]
    @State var sizeSelection = 0
    @State var size = ""
    
    
    var product: Product

   // var cart : Cart
    
    
    @Binding var selectedSize : String
    @Binding var selectedSizePrice : Float
    
    @Binding var total: Float
    
    @Binding var showAddToCartAlert : Bool
    @State var addToCartClicked = false

    @Binding var setModalHeight : CGFloat
    
    
    
    private func delayFetch() {
        // Delay of 2.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            productVM.fetchProducts()
            showAddToCartAlert.toggle()
        }
    }
    
    
    var body: some View {
 
        VStack {
            HStack {
                // Express Checkout
                NavigationLink(destination:
                                Text("Checkout view")
                               // CheckoutView()
                ) {
                    Text("Express Checkout")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.red)
                        .cornerRadius(6)
                    
                }
                .simultaneousGesture(TapGesture().onEnded{
                    
                    self.expressCheckOut = true
                    print(expressCheckOut)
                })
                .alert(isPresented: $addItemToCartAlert) {
                    
                    Alert(title: Text("Add Size"), message: Text("Please select a size first "), dismissButton: .default(Text("OK")))
                }
                
                // Add to Cart
                Button(action: {
                    cartVM.items.forEach { item in
                        
                        // check for duplicates
                        if item.id.count >= 1 {
                            print("DEBUG: duplicate products")
                        } else {
                            print("DEBUG: only one item ")
                        }
                    
                    
                    }
                    
                    
                    
                  //  cartVM.updateProductCartQuantity(id: cart.id, quantity: String(cart.quantity))
                    
                    // Add to cart
                    cartVM.addToCart(product: product, selectedSize: selectedSize, selectedSizePrice: selectedSizePrice, quantity: quanity, offset: 45, isSwiped: false, total: total)
                    
              //      cartVM.items.contains { cart in
                    
                        
                      //  var price : Float = 0
                        
                          
                       // return getPrice(value: price)
                    
                    
                 
                    
//                    if auth.userSession == nil  {
//                        self.openRegistration.toggle()
//                    } else if auth.userSession != nil  {
//
//                        // size not selected
//                        if selectedSize == "" {
//                            showAddToCartAlert.toggle()
//                            delayFetch()
//
//                        } else {
//
//
//                        }
////
//
//                        let totalAmount = 2  * selectedSizePrice
//                        print("DEBUG: \(totalAmount)")
//                        total = totalAmount
//
//                        print("DEBUG TOTAL : \(total)")
//
 //                   }
                    //  viewModel.addProductToCart()
                    //                   if selected_Size == true {
                    //                            self.ItemAddedToCartAlert.toggle()
                    //                            viewModel.addProductToCart()
                    ////                            //
                    ////
                    ////                           let docRef = COLLECTION_PRODUCTS.document(product.id)
                    ////
                    ////                            cartVM.addToCart(docRef: docRef, id: product.id, name: product.name, size: size, quanity: quanity, price: price)
                    //                        } else {
                    //                            self.addItemToCartAlert.toggle()
                    //                            print("ff")
                    //                        }
                    //                   }
                    
                    //  auth.fetchAllUser()
                    
                    // open size
                    
                }) {
                    Text("Add to Cart")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.black)
                        .cornerRadius(6)
                }
                //                .alert(isPresented: $ItemAddedToCartAlert) {
                //
                //                    Alert(title: Text("Item Added"), message: Text("Thank You!"), dismissButton: .default(Text("OK")))
                //                }
                //
                
                
                
                .sheet(isPresented: self.$openRegistration) {
                    if auth.userSession == nil { // && auth.user?.storeOwner == false {
                        //  LoginOrRegisterView(demoButtonClicked: $demoButtonClicked, buildButtonClicked: $buildButtonClicked)
                        RegistrationView()
                    } else if auth.userSession != nil  {
                        // LoginView()
                        
                        
                    }
                }
                
            }
            
            //          //  Picker(selection: $sizeSelection , label: Text("Size")) {
            //            ScrollView(.horizontal) {
            //                ForEach (0..<size.count, id: \.self) { index in
            //                    HStack {
            //                        Text(self.size[index]).tag(index)
            //                    }
            //
            //                }
            //            }
            //
            
        }
            
           
          
        
    }
}
//
//struct ExpressAndCart_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpressAndCart()
//    }
//}

