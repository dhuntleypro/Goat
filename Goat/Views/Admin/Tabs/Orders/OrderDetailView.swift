//
//  OrderDetailView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/23/21.
//


import SwiftUI

struct OrderDetailView: View {
    @ObservedObject var orderVM = OrderViewModel()
    
    var order: Order
    
    @State var editShippingAddress = false
    @State var shipTo = false
    @State var inPersonPurchase = false
    @State var shippingCost : Float = 0
        
          
    
    var body: some View {
        
        VStack(alignment : .leading) {
            Group {
                Text("\(order.fullname)")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(order.customerName)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("\(order.amount.clean) orders")
                    .font(.headline)
                    .foregroundColor(.black)
            }
            
            
            Divider()
            
            Group {
                HStack {
                    Text("Shipping information")
                    
                    Spacer()
                    
                    Button(action: {
                        self.editShippingAddress.toggle()
                        
                    }) {
                        Text("Edit")
                            .foregroundColor(.black)
                    }
                    .sheet(isPresented: $editShippingAddress) {
                        ShippingInfoView()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Address: \(order.address)")
                    Text("City: \(order.city)")
                    Text("State: \(order.state)")
                    Text("Zip: \(order.zip)")
                }
                .font(.headline)
                .foregroundColor(.black)
                .padding(.vertical)
                
            }
            
            
            Divider()
            
            Group {
                
                Text("Contact")
                    .bold()
                
                HStack {
                    
                    Text("Phone: \(order.phoneNumber)")
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "phone")
                        }
                        
                        
                        Button(action: {}) {
                            Image(systemName: "message")
                        }
                    }
                }
                .padding(.vertical)
                
                HStack {
                    Text("Email: \(order.email)")
                    
                    Spacer()
                    
                    
                    Button(action: {}) {
                        Image(systemName: "envelope")
                            .font(.system(size: 16, weight: .regular))
                    }
                }
                
                Divider()
                
              
                Text("Pricing")
                    .bold()
                
                PricingBreakdownView(shipTo: $shipTo, inPersonPurchase: $inPersonPurchase, shippingCost: $shippingCost)
                
            }
            
            
            Spacer()
            
        }
        .padding()
        .navigationBarTitle("Order Information")
        .onAppear() {
            orderVM.fetchOrders()
        }
    }
    
    private func markAsCompleted() {
        
        if !order.isCompleted {
            //    order.isCompleted = true
            //   order.saveOrderToFirestore()
        }
    }
}




//            VStack(alignment: .leading) {
//                HStack {
//                    Text("Orders: ")
//                    Text("\(orderVM.orders.count)")
//                }
//
//                Text("Customers")
//                    .font(.system(size: 25, weight: .bold, design: .rounded))
//
//                List {
//                    ForEach(orderVM.orders) { order in
//                        NavigationLink(destination: UserDetailView(order: order)) {
//                            OrderCell(order: order)
//                        }
//                    }
//                }
//            }
//
//
//        .navigationBarTitle("Order", displayMode: .inline)
//        .navigationBarItems(trailing:
//
//            Button(action: {
//                self.markAsCompleted()
//            }, label: {
//                Text("Complete Order")
//            })
//        )
//    } //End of Body


//    private func markAsCompleted() {
//
//        if !order.isCompleted {
//        //    order.isCompleted = true
//         //   order.saveOrderToFirestore()
//        }
//    }
//}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: Order(dictionary: ["String" : "Any"]))
    }
}
