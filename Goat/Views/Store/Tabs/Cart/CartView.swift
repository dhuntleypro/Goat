//
//  CartView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI
import Kingfisher


struct CartView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var cartVM = CartViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack() {
                
                HStack {
                    //                Button(action: {
                    //                    presentationMode.wrappedValue.dismiss()
                    //                }) {
                    //                    Image(systemName: "chevron.left")
                    //                        .foregroundColor(.black)
                    //                }
                    
                    Spacer()
                    
                    NavigationLink(destination: CheckoutView() ) {
                        Text("Checkout")
                            .modifier(myFillButton200BY35(bgColor: .black, txtColor: .white))
                    }
                }
                .padding()
                
                
                HStack {
                    Text("Total")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(calculateTotalPriceNow())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                .padding()
                
                Divider()
                    .padding(.top, 5)
                
                ForEach(cartVM.items) { item in
                    
                    CartCell(item: $cartVM.items[getIndex(item: item)], items: $cartVM.items , selectedSizePrice : item.cost , isSwiped : item.isSwiped , offset: item.offset )
                }
                
                NavigationLink(destination: CheckoutView() ) {
                    Text("Checkout")
                        .modifier(myFillButton200BY35(bgColor: .black, txtColor: .white))
                }
                .padding()
                
                Spacer()
            }
            
            
            
            
            
        }
        .navigationBarHidden(true) // fixed nav hight issuw
      //  .navigationBarBackButtonHidden(true)
              .navigationTitle(Text("Cart"))
        //        .navigationBarItems(
        //            leading:
        //                Button(action: {
        //                    presentationMode.wrappedValue.dismiss()
        //                }) {
        //                    Image(systemName: "chevron.left")
        //                        .foregroundColor(.black)
        //                }
        //                ,trailing:
        //                    NavigationLink(destination: CheckoutView() ) {
        //                        Text("Checkout")
        //                            .modifier(myFillButton100BY35(bgColor: .black, txtColor: .white))
        //                    }
        //        )
        .onAppear(){
            cartVM.fetchUserCart()
        }
    }
    //    // worker
    func getPrice(value: Float)-> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
    //
    // worker
    func getIndex(item: Cart)->Int {
        return cartVM.items.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    
    func calculateTotalPriceNow()->String {
        
        var price : Float = 0
        
        cartVM.items.forEach { item in
            price += item.cost * Float(item.quantity)
            
        }
        return getPrice(value: price)
    }
    
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//    }
//}

