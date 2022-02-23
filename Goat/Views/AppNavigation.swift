//
//  AppNavigation.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct AppNavigation: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    
    var body: some View {
       // Group {
            // Admin - Store owner (un-paid)
            if viewModel.userSession != nil && ADMIN_UIDS.contains(viewModel.user?.id ?? "abc") {
                NavigationView {
                // OnboardingPage1View() // show once
                   DashboardView()
               
                }
                .navigationViewStyle(StackNavigationViewStyle())

            // Average customer (error)
            } else if viewModel.userSession != nil  && ADMIN_UIDS.contains("normal User") {
                
                NavigationView {
                    VStack {
                        MainTabView()
                      //  DashboardView()
                    }
                    //   .navigationBarTitle(viewModel.tabTitle(forIndex: selectedIndex))
                    //   .navigationBarTitleDisplayMode(.inline)
                }
                .navigationViewStyle(StackNavigationViewStyle())

                
            } else if viewModel.userSession == nil {
                NavigationView {
                    WelcomeView()
                    // LoginView()
                }
                .navigationViewStyle(StackNavigationViewStyle())

            } else {
                Text("error with navigation")
            }
      //  }
    }
}

struct AppNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigation()
    }
}
