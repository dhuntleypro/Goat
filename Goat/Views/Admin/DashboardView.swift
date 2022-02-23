//
//  DashboardView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct DashboardView: View {
    
    @State var showDashboard = true
    
    @State var showDesign = false
    @State var showPreview = false

    @State var editMode = false
    
    @State var previewingApp = false
    
    @State var modalHeight : CGFloat = 800
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
           
            VStack {
                Spacer().frame(height: 50)
                
                // STORE
                MainTabView()
 
            }

            VStack {
                DashHeaderView(showDashboard: $showDashboard, editMode: $editMode)

                Spacer()
            }
            
            
            HalfModalView(isShown: $showDashboard, bgColor: .white, bgOpacityLevel: 1.0, dismissableBackground: false   , modalHeight : UIScreen.main.bounds.height - 100
            ) {
               // DashboardContentView()
                DashTabView()
                
            }

        }
        
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
