//
//  ContentView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        TabView{
            HomeView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "app")
                    
                }
            
            
            StyleView()
                .tabItem {
                    Text("Style")
                    Image(systemName: "hands.clap")
                    
                }
            
            SearchView()
                .tabItem {
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                    
                }
            
            
            CartView()
                .tabItem {
                    Text("Cart")
                    Image(systemName: "cart")
                    
                    
                }
            
            ProfileView()
                .tabItem {
                    Text("Profile")
                    Image(systemName: "person")
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
