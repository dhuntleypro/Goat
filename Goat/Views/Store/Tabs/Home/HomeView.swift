//
//  HomeView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct HomeView: View {
    
    @State var index = 0
    
    
    @Binding var editMode : Bool
    @Binding var previewingApp : Bool
    @Binding var showDashboard : Bool
//    @Environment(\.presentationMode) var presentationMode

    
    @State var SlideGesture = CGSize.zero
    @State var SlideOne = false
    @State var SlideOnePrevious = false
    @State var SlideTwo = false
    @State var SlideTwoPrevious = false
    
    
    
    @State var selectedOption: CustomSegmentedOptions = .Discover

    var body: some View {
        
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                if self.index == 0 {
                    
                    VStack(alignment: .center, spacing: -0.1) {
                        
                        
                        CustomSegmentedView(selectedOption: $selectedOption, SlideGesture: $SlideGesture, SlideOne: $SlideOne, SlideTwo: $SlideTwo)
                            
                          //  .padding(.horizontal)
                          //  .padding(.top)
                        
                        //discover content
                        if selectedOption == .Discover {
                            NavigationView{
                            DiscoverView(editMode: $editMode)
                                .background(Color.white).edgesIgnoringSafeArea(.all)
                            }
                            .navigationBarHidden(true)

                        } else if selectedOption == .Calender {
                            NavigationView{
                            CalenderView()
                                .background(Color.white).edgesIgnoringSafeArea(.all)
                        }
                        .navigationBarHidden(true)
                        } else {
                            
                        }
                        
                        //  Spacer()
                        
                    }
                    
                }
            }
            
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(editMode: .constant(false), previewingApp: .constant(false), showDashboard: .constant(false))
    }
}
 

