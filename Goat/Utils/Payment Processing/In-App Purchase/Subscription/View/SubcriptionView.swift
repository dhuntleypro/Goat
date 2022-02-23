//
//  SubcriptionView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/21/21.
//


import SwiftUI

struct SubcriptionView: View {
    //Inland22x34!
    @State var priceToUpdate = "$5/Month"
    
    var body: some View {
        VStack {
            ScrollView {
               
                Image("image").clipShape(Circle())
                
                Text("Apps For The Nation")
                    .font(.largeTitle)
                    .foregroundColor(.purple).padding()
                Text("Subtitle for in app screen")
                    .font(.system(size: 19.0))
                    .foregroundColor(.purple).padding()
                Text("Start your 7-day free trail")
                HStack {
                    Text("Then").font(.system(size: 19.0))
                    Text(priceToUpdate).font(.system(size: 19.0))
                }.padding()
                
                Button("Subcribe Now") {
                 //   IAPService.shared.purchaseProduct(product: .monthlySubcription)
                }.padding().font(.title).background(Color.purple).foregroundColor(Color.white).cornerRadius(15)
                
                Text("Offer a seamless experience for digital subscriptions in your apps. In-app purchase APIs provide a simple, powerful way to implement auto-renewable subscriptions in apps on all Apple platforms and in all App Store categories.Offer a seamless experience for digital subscriptions in your apps. In-app purchase APIs provide a simple, powerful way to implement auto-renewable subscriptions in apps on all Apple platforms and in all App Store categories.").padding().lineLimit(nil)
                
                HStack {
                    
                    Button("Terms of use") {
                        UIApplication.shared.open(URL(string: "https://developer.apple.com/")!)
                    }
                    Spacer()
                    
                    Button("Privacy Policy") {
                        UIApplication.shared.open(URL(string: "https://developer.apple.com/")!)
                    }
                    
                }
            }
            .padding(.horizontal)
            .onAppear {
              //  IAPService.shared.getProducts()
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                    if IAPService.shared.localPriceYearly == ""{
//                        self.priceToUpdate = ""//"\(IAPService.shared.localPriceYearly)/year"
//
//                    }else{
//                        self.priceToUpdate = "" // "\(IAPService.shared.localPriceYearly)/year"
//                    }
//                }
            }
        }
        .navigationBarItems(
            
            
            trailing:
        
                Button("Restore Purchase") {
                    DispatchQueue.main.async{
                     //   IAPService.shared.resotePurchases()
                       // store.restorePurchases()
                    }
                }
        
        )
    }
}

struct SubcriptionView_Previews: PreviewProvider {
    static var previews: some View {
        SubcriptionView()
    }
}
