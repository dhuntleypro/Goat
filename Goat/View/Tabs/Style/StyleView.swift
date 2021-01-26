//
//  StyleView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//


import SwiftUI



struct StyleView: View {
    
    @State var condition = [String]()
    
    var compareData = [Style]()
    
    var body: some View {
        VStack {
        ScrollView {
            VStack {
                
                
                ForEach(MOCK_STYLE_COLLECTION) { collection in
                    // Section image
                    VStack {
                        // Head Image for Collection
                        NavigationLink(destination: ViewAllView(collection: collection)) {
                            ZStack {
                                Image(collection.modelImage)
                                    .resizable()
                                    .scaledToFill()
                                    .overlay(Color(.black).opacity(0.1))
                                    .frame(width: UIScreen.main.bounds.width, height: 700)
                            

                                VStack {
                                Text(collection.title)
                                        .font(.system(size: 33 , weight: .semibold))
                                        .foregroundColor(.white)

                                    Text(collection.caption)
                                        .font(.system(size: 23 , weight: .semibold))
                                        .foregroundColor(.gray)
                            }
                            }
                        }
                    
                        // Name and shop all
                        HStack {
                            Text(collection.modelName)
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .font(.system(size: 22, weight: .medium, design: .default))
                            
                            Spacer()
                            
                            NavigationLink(destination: ViewAllView( collection: collection)) {
                                Text("View All")
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                    .font(.system(size: 16, weight: .medium, design: .default))
                            }
                         
                             
                        }
                        .padding(30)
                        
                        VStack {


                            // FILTERED PRODUCT BY COLLECTION
                            ScrollView(.horizontal, showsIndicators: false){

                                HStack(spacing: 20) {

                                    ForEach(MOCK_STYLE){ style in

                                        ForEach(style.tags,id:\.self){ tagName in

                                            ForEach(collection.conditions,id:\.self) { conditiondata in

                                                if collection.conditions.count != 0 && conditiondata == tagName {
                                                    NavigationLink(destination: StyleDetailsView(style: style)) {

                                                        Image(style.modelImage)
                                                            .resizable()
                                                            .scaledToFill()
                                                            .frame(width: 250, height: 430)
                                                            .clipShape(Rectangle())



                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.trailing, 110)
                            }
                        }
                    }
                }
            }
            .padding(.bottom,  100)
        }
        }
        .background(Color.black)
        // lessen highlight when holding down on screen
        .buttonStyle(PlainButtonStyle())
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}













//



//struct StyleView: View {
//
//    @State var condition = [String]()
//
//    var compareData = [Style]()
//
//    var body: some View {
//
//        ScrollView {
//            VStack {
//
//
//                ForEach(MOCK_STYLE) { style in
//                    // Section image
//                    VStack {
//
//                        // Head Image for Collection
//                        NavigationLink(destination: ViewAllView(style: style)) {
//                            StyleImageCell(style: style)
//
//
//                        }
//
//                        // Name and shop all
//                        HStack {
//                            Text(style.name)
//                                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//                                .font(.system(size: 22, weight: .medium, design: .default))
//
//
//                            Spacer()
//
//
//                            NavigationLink(destination:
//                                            ViewAllView(style: style)
//                                           //   Calender()
//                                           ,
//                                           label: {
//                                            Text("View All")
//                                                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
//                                                .font(.system(size: 16, weight: .medium, design: .default))
//
//                                           })
//                        }
//                        .padding(30)
//
//                        VStack {
//
//
//                            // Style Slider
//                            ScrollView(.horizontal, showsIndicators: false) {
//                                HStack(spacing: 50) {
//
//                                    ForEach(MOCK_STYLE){ style in
//
//                                        ForEach(style.tags,id:\.self){ tagName in
//
//                                            ForEach(style.conditions,id:\.self) { conditiondata in
//
//                                                if style.conditions.count != 0 && conditiondata == tagName {
//                                                    NavigationLink(destination: StyleDetailsView()) {
//                                                        StyleStyleCell02(style: style)
//
//
//
//                                                    }
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                            }
//                        }
//                    }
////                    .background(Color.black)
//
//                }
//            }
//            .padding(.bottom,  50)
//        }
//        .background(Color.black)
//
//        .edgesIgnoringSafeArea(.all)
//        .navigationBarHidden(true)
//    }
//}
//
//
//
//
