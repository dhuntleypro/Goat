//
//  ExpressAndCart.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ExpressAndCart: View {
    var product: Product

    @State var expressCheckOut = false
    
    
    // @State private var showAlert = false
    @State private var showLogin = false // (fix make changable toggle on admin side )
    @State var itemAdded = false
    @State private var addItemToCartAlert = false
    let colors: [Color] = [.red, .green, .blue]
    @State var sizeSelection = 0
    
    
    
    
    var body: some View {
        
        VStack {
            HStack {
                // Express Checkout
                NavigationLink(destination: CheckoutView()) {
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

                
                // Add to Cart
                Button(action: {
                  //  if FUser.currentUser() != nil && FUser.currentUser()!.onBoarding {
                        
                        
                     //   self.addItemToCart()
                        self.addItemToCartAlert.toggle()
                        
                        
              //      } else  {
                        self.showLogin.toggle()
               //     }
                    
                    
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
                .alert(isPresented: $addItemToCartAlert) {
                    
                    Alert(title: Text("Item Added"), message: Text("Thank You!"), dismissButton: .default(Text("OK")))
                }
//                .sheet(isPresented: self.$showLogin) {
//
//                    if FUser.currentUser() != nil {
//                        FinishRegistrationView()
//                    } else {
//                        LoginView()
//                    }
//                }
                
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
