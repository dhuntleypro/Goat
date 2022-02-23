//
//  PayPal.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/6/21.
//

//// Paypal
//var paypalAccount = ""
//var paypalSandBoxAccount = "sb-qebn63434621@business.example.com"
//var paypalClienID = "Ab5-kTX9bOsJOIoI5uliQ2e2YIQA5_ueehEaJHLvWUlaiC-eWebqZ7ubnVpxbHCpr8s5dBr8J43bVJZc"
//// may not need
//var paypalSecret = "EDydi9QKWVEhRHpibGHPB1xknvXMT2lA9epRiu-Gzhe5zW_9Y1Pb3Jm2t5defYs3UoSTsr3756VyoDUh"
//
//
//
//import SwiftUI
//// import BraintreeDropIn
//// import Braintree
//import BraintreePayPal
////import BraintreePaymentFlow
////import BraintreeCard
//
//
//struct BTDropInRepresentable: UIViewControllerRepresentable {
//    var authorization: String
//    var handler: BTDropInControllerHandler
//
//    init(authorization: String, handler: @escaping BTDropInControllerHandler) {
//        self.authorization = authorization
//        self.handler = handler
//    }
//
//    func makeUIViewController(context: Context) -> BTDropInController {
//        let bTDropInController = BTDropInController(authorization: authorization, request: BTDropInRequest(), handler: handler)!
//        return bTDropInController
//    }
//
//    func updateUIViewController(_ uiViewController: BTDropInController, context: UIViewControllerRepresentableContext<BTDropInRepresentable>) {
//    }
//}
//
//
//
//
//
//struct Paypal: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//
//    func showDropIn(clientTokenOrTokenizationKey: String) {
//        let request =  BTDropInRequest()
//        let dropIn = BTDropInController(authorization: clientTokenOrTokenizationKey, request: request)
//        { (controller, result, error) in
//            if (error != nil) {
//                print("ERROR")
//          //  } else if (result?.isCancelled == true) {
//          //      print("CANCELLED")
//         //   } else if result != nil {
//                // Use the BTDropInResult properties to update your UI
//                // result.paymentOptionType
//                // result.paymentMethod
//                // result.paymentIcon
//                // result.paymentDescription
//            }
//            controller.dismiss(animated: true, completion: nil)
//        }
//
//
//        // Display our payment request
//
//        dropIn?.present(dropIn!, animated: true, completion: nil)
//
//
//
//       // self.present(dropIn!, animated: true, completion: nil)
//    }
//}
//
//struct Paypal_Previews: PreviewProvider {
//    static var previews: some View {
//        Paypal()
//    }
//}
