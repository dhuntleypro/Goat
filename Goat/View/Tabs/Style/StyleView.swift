//
//  StyleView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//


import SwiftUI

struct StyleView: View {
    
    @State var condition = [String]()
    
    var compareData = [Product]()
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                
                ForEach(MOCK_STYLE) { style in
                    // Section image
                    VStack {
                        
                        // Head Image for Collection
                        NavigationLink(destination: ViewAllView(style: style)) {
                            StyleImageCell(style: style)

                            
                        }
                        
                        // Name and shop all
                        HStack {
                            Text(style.name)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .font(.system(size: 22, weight: .medium, design: .default))
                            
                            
                            Spacer()
                            
                            
                            NavigationLink(destination:
                                            ViewAllView(style: style)
                                           //   Calender()
                                           ,
                                           label: {
                                            Text("View All")
                                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                                .font(.system(size: 16, weight: .medium, design: .default))
                                            
                                           })
                        }
                        .padding(30)
                        
                        VStack {
                            
                            
                            // Product Slider
                            ScrollView(.horizontal, showsIndicators: false)
                            {
                                HStack(spacing: 50) {
                                    
                                    ForEach(MOCK_STYLE){ style in
                                        
                                        ForEach(style.tags,id:\.self){ tagName in
                                            
                                            ForEach(style.conditions,id:\.self) { conditiondata in
                                                
                                                if style.conditions.count != 0 && conditiondata == tagName {
                                                    NavigationLink(destination: StyleDetailsView()) {
                                                        StyleProductCell02(style: style)
                                                        
                                                        
                                                    
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
//                    .background(Color.black)

                }
            }
            .padding(.bottom,  50)
        }
        .background(Color.black)

        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}




