//
//  DashContentSliderView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct DashContentSliderView: View {
    var body: some View {
        //
        ScrollView(.horizontal){
            HStack {

            ForEach(0..<5) { _ in
                HStack {
                    ZStack(alignment: .bottomLeading) {
                        Color(.blue).frame(width: 300, height: 200)
                       

                        VStack {
                            Text("Create Something to Remember")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .frame(width: 230, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                        }
                        .padding()

                    }
                    .cornerRadius(15.0)
                    
                }
            }
            
        }
            .padding(.leading)
        }
    }
}

struct DashContentSliderView_Previews: PreviewProvider {
    static var previews: some View {
        DashContentSliderView()
    }
}
