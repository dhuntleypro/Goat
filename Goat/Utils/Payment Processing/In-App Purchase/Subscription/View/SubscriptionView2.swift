//
//  SubscriptionTypePricingView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//


import SwiftUI

struct SubscriptionView2: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var store: Store
    
    //   @ObservedObject var subscriptionVM = SubscriptionViewModel()
    @ObservedObject var subscriptionTypeVM = SubscriptionTypeViewModel()
    
    
    var body: some View {
        
        
        ZStack {
            
            Color(.black).edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                    })
                    
                    Spacer()
                    
                    
                    Button("Restore Purchase") {
                        store.restorePurchases()
                        
                    }
                }
                .padding()
                
                
                ScrollView(.horizontal) {
                    VStack {
                        
                        
                        HStack {
                            Text("Select a Plan")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title)
                                .offset(y: 5)
                            Spacer()
                        }
                        VStack(spacing: 20 ) {
                            
                            //     HStack(spacing: 20 ) {
                      //    ForEach(subscriptionTypeVM.subscriptionTypes , id: \.id) { subscription in
                            
                            ForEach(store.allSubscriptionTiers, id : \.self) { subscriptionTier in
                                
                                Group {
                                    if !subscriptionTier.isLocked {
                                        NavigationLink( destination: Text("Paid Subscription Home ")) {
                                            SubscriptionTiersRow(subscriptionTier: subscriptionTier) { }
                                            //    SubscriptionCell(subscription: subscription)
                                            
                                        }
                                    } else {
                                        SubscriptionTiersRow(subscriptionTier: subscriptionTier) {
                                            if let product = store.product(for: subscriptionTier.id) {
                                                store.purchaseProduct(product)
                                            }
                                        }
                                    }
                                }
                              //  .navigationTitle("Subscription")
                            }
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
            
            
            
            // create subs
            
            //              Button(action: {
            //                   createSubscriptionTypes()
            //              }) {
            //                  Text("create subscriptions ")
            //              }
        }
        .navigationBarHidden(true)
        
        
    }
    
    func createSubscriptionTypes() {
        
        subscriptionTypeVM.createSubscriptionType(
            subscriptionID: "0123",
            name: "Bronze",
            description: "",
            subscriptionType: "Bronze",
            storeSelected: false,
            price: 34.99,
            yearPrice : 399.99,
            salePrice: 25,
            onSale: false,
            image: "bronze",
            icon: "cart",
            subscriptionSortCount: 1,
            features: [
                "fast",
                "advertising"
                
            ]
        )
        
        
        subscriptionTypeVM.createSubscriptionType(
            subscriptionID: "099",
            name: "Gold",
            description: "",
            subscriptionType: "Gold",
            storeSelected: false,
            price: 125,
            yearPrice : 1449.99,
            salePrice: 25,
            onSale: false,
            image: "gold",
            icon: "cart",
            subscriptionSortCount: 2,
            features: [
                "fast",
                "advertising"
                
            ]
        )
        
        
        subscriptionTypeVM.createSubscriptionType(
            subscriptionID: "088", // (fix) can remove
            name: "Platinum",
            description: "",
            subscriptionType: "Platinum",
            storeSelected: false,
            price: 375,
            yearPrice : 4249.99,
            salePrice: 25,
            onSale: false,
            image: "platinum",
            icon: "cart",
            subscriptionSortCount: 3,
            features: [
                "Available on App store",
                "advertising",
                "new"
                
                
            ]
        )
    }
}

//struct SubscriptionTypePricingView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubscriptionTypePricingView()
//    }
//}




