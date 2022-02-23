//
//  CompleteOrderView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/24/21.
//

import SwiftUI

struct CompleteOrderView: View {
    @EnvironmentObject var auth: AuthViewModel
    @State var user: User?

    
    @ObservedObject var cartVM = CartViewModel()
    @ObservedObject var orderVM = OrderViewModel()

    @Binding var checkout : Bool
    @Binding var paymentType : Int
    @Binding var PaymentTypeText : String
    @Binding var shippingCost : Float

    
    
    
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
    
    func getPriceString(value: Float)-> String {
       // let format = NumberFormatter()
       // format.numberStyle = .currency
        
        return  String(value)
    }
    
    
    func subTotal()->String {
        
        var price : Float = 0
        
        cartVM.items.forEach { item in
            price += item.cost * Float(item.quantity)
            
        }
        print("DEBUG::  \(price)")
        return getPriceString(value: price)
    }
    
    func calculateTax()->String {
        
        var total : Float = 0
        
        cartVM.items.forEach { item in
            total += item.cost * Float(item.quantity)
            
        }
      //  return getPrice(value: total  * Float(nyTax))
        return getPriceString(value: total  * Float(nyTax))
    }
    
    func calculateTotal()->String {
        // subtotal
        var price : Float = 0
      
        cartVM.items.forEach { item in
            price += item.cost * Float(item.quantity)
            
        }
        
      //  return getPrice(value: (price + shippingCost))
        return getPriceString(value: (price + shippingCost))
    }
    
    
    let paymentHandler = PaymentHandler()
    
    
    var body: some View {
        VStack {
            Text(user?.fullname ?? "")
            Text(user?.email ?? "")
            Text(user?.phoneNumber ?? "")
            Text(user?.fullAddress ?? "")
            
            
            Button(action: {
                orderVM.createOrder(
                    username:  user?.username ?? "", //user?.username ?? "",
                    fullname: user?.fullname ?? "",
                    profileImageURL: auth.user?.profileImageURL ?? "",
                    address: auth.user?.fullAddress ?? "",
                    city: auth.user?.city ?? "",
                    state: auth.user?.state ?? "",
                    zip: user?.zip ?? "",
                    phoneNumber: auth.user?.phoneNumber ?? "",
                    email: auth.user?.email ?? "",
                    subtotal: subTotal(),
                    shipping: shippingCost,
                    estimatedTax: calculateTax(),
                    total: calculateTotal()
                )
                
                self.PaymentProcess()
                
            }) {
                Text("Complete Order")
            }
            .modifier(myFillButton300BY45(bgColor: .black))
            .sheet(isPresented: self.$checkout) {
//                        BTDropInRepresentable(authorization: self.token, handler:  { (controller, result, error) in
//                                    if (error != nil) {
//                                        print("ERROR")
//                                        } else if (result?.isCancelled == true) {
//                                            print("CANCELLED")
//                                        } else if result != nil {
//                                            print("SUCCESS")
//                                        // Use the BTDropInResult properties to update your UI
//                                        // result.paymentOptionType
//                                        // result.paymentMethod
//                                        // result.paymentIcon
//                                        // result.paymentDescription
//                            }
//                                    controller.dismiss(animated: true, completion: nil)
//                            })
                }
            
            Text("By proceeding, I confirm I have read and agree to the Purchase & Return Policy")
                .font(.system(size: 8))
                .foregroundColor(.gray)
                .padding(5)
                .padding(.bottom , 25)
        }
    }
    
    private func PaymentProcess() {
        
        if paymentType == 0 {
            PaymentTypeText = CheckoutView.paymentTypes[0]
        
            
            self.paymentHandler.startPayment(subtotal:"\(subTotal())", tax: calculateTax(), total: calculateTotal() ,  completion: { (success) in
                if success {
                    print("Success")
                } else {
                    print("Failed")
                }
            })
           
            
            
        }else if paymentType == 1 {
            PaymentTypeText = CheckoutView.paymentTypes[1]
            
            
            
            
        }else if paymentType == 2 {
            
            PaymentTypeText = CheckoutView.paymentTypes[2]
//            showDropIn(clientTokenOrTokenizationKey: "sandbox_6mjnf8nc_x596q5gd83rxjpq9")
            //  fetchClientToken()
            
            checkout = true
            
            
            
            
            
        }else if paymentType == 3 {
            
            PaymentTypeText = CheckoutView.paymentTypes[3]
            
            
            
            
        }else if paymentType == 4{
            
            PaymentTypeText = CheckoutView.paymentTypes[4]
        
        
        }
    
        
    }
}

struct CompleteOrderView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteOrderView(checkout: .constant(false), paymentType: .constant(0), PaymentTypeText: .constant(""), shippingCost: .constant(0))
    }
}
