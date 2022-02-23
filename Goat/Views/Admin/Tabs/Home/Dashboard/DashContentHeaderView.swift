//
//  DashContentHeaderView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct DashContentHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Home")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                
                Text("Yaw Denim")
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .foregroundColor(.gray)
            }
            
            
            Spacer()
           
            
            NavigationLink(destination: SubscriptionView2()) {
                Text("Subscribe")
                    .bold()
                    .modifier(myClearButton100BY35(bgColor: Color.blue))
            }
            
            
            NavigationLink(destination: OnboardingPage1View()) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                
            })
            
        }
        .padding()    }
}

struct DashContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DashContentHeaderView()
    }
}
