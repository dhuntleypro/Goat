//
//  Modifiers+Back.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/20/21.
//

import SwiftUI

struct GrayBackground: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 300)
            .padding(10)
            .background(
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                
            )
            .foregroundColor(.black)
    }
}


struct GrayBackgroundScreen: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: (UIScreen.main.bounds.width / 2) - 50 )
            .padding(10)
            .background(
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
            )
            .foregroundColor(.black)
    }
}


struct GrayBackgroundLarge: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 350 , height: 100)
            .padding(10)
            .background(
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
            )
            .foregroundColor(.black)
    }
}


struct GrayBackgroundSmall: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 75)
            .padding(10)
            .background(
                Rectangle()
                    .cornerRadius(10)
                    .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
            )
            .foregroundColor(.black)
        
    }
}



struct Modifiers_Background: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Modifiers_Background_Previews: PreviewProvider {
    static var previews: some View {
        Modifiers_Background()
    }
}





