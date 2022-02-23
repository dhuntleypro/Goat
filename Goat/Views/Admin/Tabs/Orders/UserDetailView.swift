//
//  UserDetailView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/23/21.
//

import SwiftUI

struct UserDetailView: View {
    
    var order: Order
    @State var user: User?
    
    
    var body: some View {
        
        
        VStack {
            
            Text(user?.fullname ?? "")
            Text(user?.email ?? "")
            Text(user?.phoneNumber ?? "")
            Text(user?.fullAddress ?? "")
            
            
            VStack {
                Text("Order Items")
                
                ForEach(self.order.orderItems) { product in
                    
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text("$ \(product.cost)")
                    }
                    
                }
            }
        }//End of list
        .navigationBarTitle("User Profile")
        
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(order: Order(dictionary: ["String" : "Any"]))
    }
}
