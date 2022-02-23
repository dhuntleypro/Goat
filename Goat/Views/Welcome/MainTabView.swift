//
//  MainTabView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct MainTabView: View {
    
    @State var editMode = false
    @State var previewingApp = false
    @State var showDashboard = false

    

    var body: some View {
                TabView {
                    HomeView(editMode: $editMode, previewingApp: $previewingApp, showDashboard: $showDashboard)
                        .onTapGesture {
                           // selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "app")
                            Text("Home")
                        }.tag(0)
                    
                    SearchView()
                        .onTapGesture {
                           // selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }.tag(1)
                    
                    CartView()
                        .onTapGesture {
                           // selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "cart")
                            Text("Cart")
                        }.tag(2)
                    
                    ProfileView()
                        .onTapGesture {
                           // selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }.tag(3)
        
                }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
