//
//  OrderView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orderVM = OrderViewModel()
    
    
    
    @State var showOrder = true
    @State var abandonedCart = false
    
    var body: some View {
        VStack(alignment: .leading , spacing : 40) {
            
            VStack(alignment: .leading , spacing : 10) {
                HStack {
                    Text("Order type")
                        .font(.system(size: 35, weight: .bold, design: .rounded))
                    
                    Button(action: {
                        orderVM.fetchOrders()
                    }) {
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                    }
                }
              
                HStack {
                    Button(action: {
                        self.showOrder.toggle()
                    }) {
                        Text("Orders")
                            .modifier(showOrder ? myClearButton150BY35(bgColor: .green) : myClearButton150BY35(bgColor: .gray))
                    }
                    
                    Button(action: {
                        self.showOrder.toggle()
                    }) {
                        Text("Abandoned Cart")
                            .modifier(showOrder ? myClearButton150BY35(bgColor: .gray) : myClearButton150BY35(bgColor: .green))
                    }
                    
                    Spacer()
                }
                
            }
            
            
            if showOrder == false {
                VStack(alignment: .leading) {
                    Text("Abandoned Cart")
                    
                    ForEach(0..<8) { _ in
                        VStack {
                            Text("Customer Name")
                                .bold()
                            
                            Text("$354")
                        }
                    }
                }
                
            } else {
                VStack(alignment: .leading , spacing: 20) {
                    HStack {
                        Text("Orders: ")
                        Text("\(orderVM.orders.count)")
                    }
                    
                    Text("Orders to Fulfill")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                    
                    
                    ForEach(orderVM.orders) { order in
                        NavigationLink(destination: OrderDetailView(order: order)) {
                            
                            OrderCell(order: order)
                        }
                    }
                }
            }
            
            
            Spacer()
        }
        .padding()
    }
    
}


struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
