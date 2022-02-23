//
//  IAPService.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//
//
//
//import Foundation
//import UIKit
//import StoreKit
//import SwiftyStoreKit
//
//class IAPService: NSObject {
//    
//    public override init() {}
//    static let shared = IAPService()
//    var appSecret = "248e56f23a114338aa2040ddaea21136" //for validating receipt
//    var products = [SKProduct]()
//    var paymentQueue = SKPaymentQueue.default()
//    var localPrice : String = ""
//    var localPriceYearly = ""
//    var isSubFlag : Bool = false
//    let testUrl = "https://sandbox.itunes.apple.com/verifyReceipt"
//    let productionUrl = "https://buy.itunes.apple.com/verifyReceipt"
//    var isalertShown = false
//    
//    
//    func isPerminumUser() -> Bool {
//        print(UserDefaults.standard.bool(forKey: "PremiumUser"))
//        let PremiumUser = UserDefaults.standard.bool(forKey: "PremiumUser")
//        if PremiumUser == true {
//            return true
//        }
//        else{
//            return false
//        }
//    }
//    
//    
//    func startObserving() {
//        paymentQueue.add(self)
//    }
//    
//    
//    func stopObserving() {
//        paymentQueue.remove(self)
//    }
//    
//    
//    func getProducts() {
//        let products : Set = [IAPProduct.monthlySubcription.rawValue]
//        let request = SKProductsRequest(productIdentifiers: products)
//        request.delegate = self
//        request.start()
//        //paymentQueue.add(self)
//    }
//    
//    func purchaseProduct(product:IAPProduct) {
//        print(product.rawValue)
//        guard let productToPurchase = products.filter({$0.productIdentifier == product.rawValue}).first else {
//            print("product not found")
//            InAppAlert(title: "Error", message: "Product not available right now,check your internet connection or try again later")
//            return
//        }
//        print(productToPurchase.productIdentifier)
//        let payment = SKPayment(product: productToPurchase)
//        if SKPaymentQueue.canMakePayments() {
//            paymentQueue.add(payment)
//        }
//        else{
//            print("User unable to make payments")
//        }
//    }
//    
//
//    
//    func validateReceiptAndUnlockContent(refresh:Bool){
//        
//        let appleValidator = AppleReceiptValidator(service: .production, sharedSecret: appSecret)
//        SwiftyStoreKit.verifyReceipt(using: appleValidator , forceRefresh: refresh) { result in
//            switch result {
//            case .success(let receipt):
//                let productIds = Set([IAPProduct.monthlySubcription.rawValue])
//                let purchaseResult = SwiftyStoreKit.verifySubscriptions(productIds: productIds, inReceipt: receipt)
//                switch purchaseResult {
//                case .purchased(let expiryDate, let items):
//                    UserDefaults.standard.set(true, forKey: "PremiumUser")
//                    if self.isSubFlag == true {
//                        self.isSubFlag = false
//                        self.InAppAlert(title: "Congratulations", message: "RestorePurchases Successfully")
//                    }
//                    print("\(productIds) are valid until \(expiryDate)\n\(items)\n")
//                case .expired(let expiryDate, let items):
//                    UserDefaults.standard.set(false, forKey: "PremiumUser")
//                    if self.isSubFlag == true {
//                        self.isSubFlag = false
//                        self.InAppAlert(title: "Alert", message: "You're subcription is expired or cancelled, please subcribe again.")
//                    }
//                    print("\(productIds) are expired since \(expiryDate)\n\(items)\n")
//                case .notPurchased:
//                    UserDefaults.standard.set(false, forKey: "PremiumUser")
//                    print("The user has never purchased \(productIds)")
//                }
//            case .error(let error):
//                print("Receipt verification failed: \(error)")
//            }
//        }
//    }
//    
//    
//    
//    func resotePurchases() {
//        if !isalertShown {
//            InAppAlert(title: "Alert", message: "Restoring your purchases please wait")
//            isalertShown = true
//        }
//        if SKPaymentQueue.canMakePayments() {
//            paymentQueue.add(self)
//            paymentQueue.restoreCompletedTransactions()
//        }
//        else{
//            print("User unable to make payments")
//        }
//    }
//    
//}
//
//
//
//extension IAPService : SKProductsRequestDelegate{
//    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
//        self.products = response.products
//        for product in response.products{
//            
//            let product_ = product.productIdentifier
//            let price_ = ("\(product.priceLocale.currencyCode?.description ?? "$") \(product.price)")
//            
//            if product_ == IAPProduct.monthlySubcription.rawValue {
//                localPriceYearly = price_
//            }
//        }
//    }
//}
//
//extension IAPService : SKPaymentTransactionObserver{
//    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
//        for transaction in transactions {
//            print(transaction.transactionState.status())
//            if transaction.transactionState.status() == "Transaction failed"{
//                InAppAlert(title: "Error", message: "Opertaion Failed , Try again later")
//                paymentQueue.finishTransaction(transaction)
//            }
//            else if transaction.transactionState.status() == "Transaction purchased"{
//                print("Conratulations you purchase is successfull")
//                UserDefaults.standard.set(true, forKey: "PremiumUser")
//                DispatchQueue.main.async {
//                    IAPService.shared.validateReceiptAndUnlockContent(refresh: true)
//                }
//                paymentQueue.finishTransaction(transaction)
//            }
//                
//            else if transaction.transactionState.status() == "failed"{
//                paymentQueue.finishTransaction(transaction)
//            }
//                
//            else if transaction.transactionState.status() == "deferred"{
//                paymentQueue.finishTransaction(transaction)
//            }
//            else{
//                //paymentQueue.finishTransaction(transaction)
//            }
//        }
//    }
//    
//    
//    
//    
//    func InAppAlert(title:String,message:String)  {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        
//        var topVC = UIApplication.shared.keyWindow?.rootViewController
//        while((topVC!.presentedViewController) != nil){
//            topVC = topVC!.presentedViewController
//        }
//        topVC?.present(alert, animated: true, completion: nil)
//    }
//    
//    
//    
//    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
//        if queue.transactions.count > 0 {
//            for transaction in queue.transactions{
//                if transaction.transactionState.status() == "restored"{
//                    IAPService.shared.isSubFlag = true
//                    DispatchQueue.main.async {
//                        IAPService.shared.validateReceiptAndUnlockContent(refresh: true)
//                    }
//                    paymentQueue.finishTransaction(transaction)
//                }
//                paymentQueue.finishTransaction(transaction)
//            }
//        }
//    }
//    
//    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
//        InAppAlert(title: "Alert", message: "We are Unable to restore you purcases,Chechk out your subcriptions in settings or try again with relevent Apple ID")
//        print("Unable to restore transation error : \(error.localizedDescription)")
//    }
//}
//
//extension SKPaymentTransactionState{
//    func status() -> String {
//        switch self {
//            
//        case .deferred:
//            return "deferred"
//            
//        case .failed:
//            return "failed"
//            
//        case .purchasing:
//            return "Transaction purchasing"
//            
//        case .purchased:
//            return "Transaction purchased"
//            
//        case .restored:
//            return "restored"
//            
//        default:
//            return "do nothing"
//        }
//    }
//}
