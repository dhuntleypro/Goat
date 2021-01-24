//
//  ProfileView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
    
        List() {
            NavigationLink(destination: AccountView()) {
                Text("Account")
            }
            
            NavigationLink(destination: OrdersView()) {
                Text("Orders")
            }
            
            NavigationLink(destination: NeedView()) {
                Text("Need")
            }
            
            NavigationLink(destination: OrdersView()) {
                Text("Settings")
            }
            
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

