//
//  HomeView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var index = 0
    
    //   @State var showTabBar = true
    
    //  var store: StoreViewModel
    
    @State var selectedFilter: TweetFilterOptions = .Discover
    
    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                if self.index == 0 {
                    
                    VStack(alignment: .center, spacing: -0.1) {
                        
                        
                        FilterButtonView(selectedOption: $selectedFilter)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        //discover content
                        if selectedFilter == .Discover {
                            DiscoverView()
                                .background(Color.white).edgesIgnoringSafeArea(.all)
                        } else if selectedFilter == .Calender {
                            CalenderView()
                                .background(Color.white).edgesIgnoringSafeArea(.all)
                        } else {
                            
                        }
                        
                        //  Spacer()
                        
                    }
                    
                }
            }
            
        }
        .navigationBarHidden(true)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
