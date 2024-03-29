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
      //  NavigationView {
       // Group {
            // Admin - Store owner (un-paid)
            if viewModel.userSession != nil && ADMIN_UIDS.contains(viewModel.user?.id ?? "abc") {
               
                // OnboardingPage1View() // show once
                   DashboardView()
               
              

            // Average customer (error)
            } else if viewModel.userSession != nil  && ADMIN_UIDS.contains("normal User") {
                
                
                    VStack {
                        MainTabView()
                      //  DashboardView()
                    }
                    //   .navigationBarTitle(viewModel.tabTitle(forIndex: selectedIndex))
                    //   .navigationBarTitleDisplayMode(.inline)
              

                
            } else if viewModel.userSession == nil {
              
                    WelcomeView()
                    // LoginView()
              

            } else {
                Text("error with navigation")
            }
      //  }
     //   .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AppNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigation()
    }
}
