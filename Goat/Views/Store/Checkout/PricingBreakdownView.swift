//
//  PricingBreakdownView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/6/21.
//

import SwiftUI
import PassKit

struct PricingBreakdownView: View {
    @ObservedObject var cartVM = CartViewModel()
    @ObservedObject var orderVM = OrderViewModel()

    
    
    @Binding var shipTo : Bool
    @Binding var inPersonPurchase : Bool
    @Binding var shippingCost : Float
    
    @State var nyTax = 8.875 / 100
    @State var checkout = false
    @State private var paymentType = 0
    @State var PaymentTypeText = ""

    
    
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
        VStack(spacing: 0) {
            VStack {
                // SUBTOTAL
                HStack {
                    Text("Subtotal")
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text("\(getPrice(value: Float(subTotal()) ?? 0))")
                        .foregroundColor(.black)
                }
                .padding(10)
                
                // SHIPPING
                HStack {
                    Text("Shipping")
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Text(getPrice(value: shippingCost))
                        .foregroundColor(.black)
                }
                .padding(10)
                
                // ESTIMATED TAX
                HStack {
                    Text("Estimated tax")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(getPrice(value: Float(calculateTax()) ?? 0))")
                        .foregroundColor(.black)
                }
                .padding(10)
                
                
                // TOTAL
                HStack {
                    Text("Total")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(getPrice(value: Float(calculateTotal()) ?? 0))")
                        .foregroundColor(.black)
                }
                .padding(10)
            }
            .padding(.bottom, 20)
            
            
        }
        .font(.system(size: 10))
        
        
    }
    
   

}

struct PricingBreakdownView_Previews: PreviewProvider {
    static var previews: some View {
        PricingBreakdownView(shipTo: .constant(false), inPersonPurchase:  .constant(false), shippingCost: .constant(0))
    }
}


