//
//  StyleView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//


import SwiftUI

struct StyleView: View {
    var body: some View {
        ZStack {
            
        VStack {
            ScrollView {
                ForEach(MOCK_STYLE) { style in
                    VStack {
                        
                        NavigationLink(destination: Text("Style View")) {
                            Image(style.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: 540)
                        }
                        
                        
                        
                        HStack {
                            
                            Text(style.name)
                                .font(.system(size: 28))
                                .foregroundColor(.white)
                                
                                
                            
                            Spacer()
                            
                            NavigationLink(destination: Text("Style View")) {
                                Text("View all")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10){
                                ForEach(MOCK_STYLE) { style in
                                    NavigationLink( destination: Text("Style Details")) {
                                        
                                        StyleProductCell(style: style)
                                    }
                                }
                                Spacer()
                                
                            }
                            
                            .padding([.leading, .top], 20)
                            .padding(.bottom , 50)
                        }
                    }
                    
                }
            }
        }
    }
        .background(Color(.black))
    .edgesIgnoringSafeArea(.all)
    }
}

struct StyleView_Previews: PreviewProvider {
    static var previews: some View {
        StyleView()
    }
}
