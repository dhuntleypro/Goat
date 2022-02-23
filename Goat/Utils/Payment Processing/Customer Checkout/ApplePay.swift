//
//  ApplePay.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/7/21.
//


import SwiftUI
import Foundation
import PassKit

let nyTax = 8.875 / 100

typealias PaymentCompletionHandler = (Bool) -> Void

class PaymentHandler: NSObject {
    @ObservedObject var cartVM = CartViewModel()
    
    
    static let supportedNetworks: [PKPaymentNetwork] = [
        .amex,
        .masterCard,
        .visa
    ]
    
    
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
    
    
    func subTotal()->String {
        
        var price : Float = 0
        
        cartVM.items.forEach { item in
            price += item.cost * Float(item.quantity)
            
        }
        return getPrice(value: price)
    }
    
    
    
    func calculateTax()->String {
        
        var total : Float = 0
        
        cartVM.items.forEach { item in
            total += item.cost * Float(item.quantity)
            
        }
        return getPrice(value: total  * Float(nyTax))
    }
    
    
    func calculateTotal()->String {
        // subtotal
        var price : Float = 0
        
        cartVM.items.forEach { item in
            price += item.cost * Float(item.quantity)
            
        }
        
        return getPrice(value: (price + 12)) // 12 for shipping
        
    }
    var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler?
    
    func startPayment(subtotal : String , tax : String ,  total : String ,  completion: @escaping PaymentCompletionHandler) {
        
        let amount = PKPaymentSummaryItem(label: "Amount", amount: NSDecimalNumber(string: subtotal), type: .final)
        let tax = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(string: tax), type: .final)
        let total = PKPaymentSummaryItem(label: "ToTal", amount: NSDecimalNumber(string: total), type: .final)
        
        paymentSummaryItems = [amount, tax, total];
        completionHandler = completion
        
        // Create our payment request
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = "merchant.com.YOURDOMAIN.YOURAPPNAME"
        paymentRequest.merchantCapabilities = .capability3DS
        paymentRequest.countryCode = "US"
        paymentRequest.currencyCode = "USD"
        paymentRequest.requiredShippingContactFields = [.phoneNumber, .emailAddress]
        paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks
        
        // Display our payment request
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present(completion: { (presented: Bool) in
            if presented {
                NSLog("Presented payment controller")
            } else {
                NSLog("Failed to present payment controller")
                self.completionHandler!(false)
            }
        })
    }
}

/*
 PKPaymentAuthorizationControllerDelegate conformance.
 */
extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {
    
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        
        // Perform some very basic validation on the provided contact information
        if payment.shippingContact?.emailAddress == nil || payment.shippingContact?.phoneNumber == nil {
            paymentStatus = .failure
        } else {
            // Here you would send the payment token to your server or payment provider to process
            // Once processed, return an appropriate status in the completion handler (success, failure, etc)
            paymentStatus = .success
        }
        
        completion(paymentStatus)
    }
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss {
            DispatchQueue.main.async {
                if self.paymentStatus == .success {
                    self.completionHandler!(true)
                } else {
                    self.completionHandler!(false)
                }
            }
        }
    }
    
}
