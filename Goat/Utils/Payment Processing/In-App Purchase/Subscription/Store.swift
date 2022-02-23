//
//  Store.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/22/21.
//

import SwiftUI
import StoreKit


typealias FetchCompletionHandler = (([SKProduct]) -> Void)
typealias PurchaseCompletionHandler = ((SKPaymentTransaction?) -> Void)


class Store: NSObject , ObservableObject {
    
    @Published var allSubscriptionTiers = [SubscriptionTier]()
    @Published var subscriptionTypes = [SubscriptionType]()

    
    private let allProductIdentifiers = Set([
        
        "yd_39999_1y",
        "yd_3499_1m"
    ])
    
    private var completedPurchases = [String]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                for index in self.allSubscriptionTiers.indices {
                    self.allSubscriptionTiers[index].isLocked = !self.completedPurchases.contains(self.allSubscriptionTiers[index].id)
                }
                
            }
        }
    }
    
    
    private var productsRequest : SKProductsRequest?
    private var fetchedProducts = [SKProduct]()
    private var fetchedCompletionHandler: FetchCompletionHandler?
    private var purchaseCompletionHandler: PurchaseCompletionHandler?
    
    
    override init() {
        super.init()
        
        startObservingPaymentQueue()
        
        fetchProducts { products in
            print(" DEBUG : \(products)")
            self.allSubscriptionTiers = products.map{ SubscriptionTier(product: $0) }
        }
    }
    
    private func startObservingPaymentQueue() {
        SKPaymentQueue.default().add(self)
    }
    private func fetchProducts(_ completion: @escaping FetchCompletionHandler) {
        
        guard self.productsRequest == nil else { return }
        
        fetchedCompletionHandler = completion
        
        productsRequest = SKProductsRequest(productIdentifiers : allProductIdentifiers)
        productsRequest?.delegate = self
        productsRequest?.start()
        
    }
    
    private func buy(_ product: SKProduct, completion: @escaping PurchaseCompletionHandler) {
        purchaseCompletionHandler = completion
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    
}

extension Store {
    
    func product(for identifier: String) -> SKProduct? {
        return fetchedProducts.first(where: { $0.productIdentifier == identifier
            
        })
    }
    
    func purchaseProduct(_ product: SKProduct) {
        startObservingPaymentQueue()
        buy(product) { _ in }
    }
    
    func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}




extension Store : SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            var shouldFinishTransaction = false
            switch transaction.transactionState {
            
            case .purchased, .restored:
                completedPurchases.append(transaction.payment.productIdentifier)
                shouldFinishTransaction = true
            case .failed:
                shouldFinishTransaction = true
            case .deferred , .purchasing:
                break
            @unknown default:
                break
            }
            
            if shouldFinishTransaction {
                SKPaymentQueue.default().finishTransaction(transaction)
                DispatchQueue.main.async {
                    self.purchaseCompletionHandler?(transaction)
                    self.purchaseCompletionHandler = nil
                }
            }
        }
    }
    
    
}
extension Store : SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        let loadedProducts = response.products
        let invalidProducts = response.invalidProductIdentifiers
        
        guard !loadedProducts.isEmpty else {
            print("Could not load the products!")
            if !invalidProducts.isEmpty {
                print("Invalid Products found: \(invalidProducts)")
            }
            productsRequest = nil
            
            return
        }
        
        // Cache the fetched products
        fetchedProducts = loadedProducts
        
        // Nofify anyone waiting on the product load
        DispatchQueue.main.async {
            self.fetchedCompletionHandler?(loadedProducts)
            
            self.fetchedCompletionHandler = nil
            self.productsRequest = nil
        }
    }
}
