//
//  AppNavigation.swift
//  Goat
//
//  Created by Darrien Huntley on 1/27/21.
//

import SwiftUI

struct AppNavigation: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    ContentView()
                    
                }
            } else {
                NavigationView {
                    WelcomeView()
                }
            }
        }
    }
}

struct AppNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigation()
    }
}
