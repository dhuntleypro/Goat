//
//  DashTabView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct DashTabView: View {
    @State var selectedIndex = 0
    @State var isPresented : Bool = false

    var body: some View {

        ZStack {
        VStack {
            VStack {
                if selectedIndex == 0 {
                    DashboardContentView(isPresented : $isPresented)
                } else if selectedIndex == 1 {
                    OrderView()
                } else if selectedIndex == 2 {
                    TrackView()
                }else if selectedIndex == 3 {
                    SettingsView()
                }

            }




        }
            VStack {
            Spacer()
            
            HStack(spacing: 55) {
                Button(action: {
                    selectedIndex = 0
                    
                }) {
                    VStack(spacing: 3) {
                        Image(systemName: "app")
                            .font(.system(size: 25))

                        Text("Home")
                            .font(.system(size: 10, weight: .regular , design: .rounded))
                    }
                    .foregroundColor(selectedIndex == 0 ? .white : Color(.gray).opacity(0.7))
                    
                    
                }
                
                Button(action: {
                    selectedIndex = 1
                    
                }) {
                    VStack(spacing: 3) {
                        
                        Image(systemName: "cart")
                            .font(.system(size: 25))

                        Text("Orders")
                            .font(.system(size: 10, weight: .regular , design: .rounded))
                    }
                    .foregroundColor(selectedIndex == 1 ? .white : Color(.gray).opacity(0.7))
                    
                }
                
                
                Button(action: {
                    selectedIndex = 2
                    
                }) {
                    VStack(spacing: 3) {
                        
                        Image(systemName: "person")
                            .font(.system(size: 25))

                        Text("Track")
                            .font(.system(size: 10, weight: .regular , design: .rounded))
                    }
                    .foregroundColor(selectedIndex == 2 ? .white : Color(.gray).opacity(0.7))
                    
                }
                
                Button(action: {
                    selectedIndex = 3
                    
                }) {
                    VStack(spacing: 3) {
                        
                        Image(systemName: "gear")
                            .font(.system(size: 25))

                        Text("Settings")
                        .font(.system(size: 10, weight: .regular , design: .rounded))

                    }
                    .foregroundColor(selectedIndex == 3 ? .white : Color(.gray).opacity(0.7))
                }
            }
            .padding(.bottom)
            .edgesIgnoringSafeArea(.all)
          //  .font(.system(size: 13, weight: .regular , design: .rounded))
       //     .foregroundColor(Color(.blue))
            .frame(width: UIScreen.main.bounds.width, height: 90)
            .background(Color(.black))
                
            }
        }
    }
}

struct DashTabView_Previews: PreviewProvider {
    static var previews: some View {
        DashTabView()
    }
}
