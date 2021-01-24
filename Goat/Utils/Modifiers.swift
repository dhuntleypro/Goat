//
//  Modifiers.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct Modifiers: View {
    var body: some View {
        VStack {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Even")
        })
        .modifier(ClearButtonEven(bgColor: .black))
            
            
            Button(action: {}, label: {
                Text("Small")
            })
            .modifier(ClearButtonStyleSmall(bgColor: .black))
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("large")
            })
            .modifier(ClearButtonStyleLarge(bgColor: .black))
                
                
            
        }
        
        
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        Modifiers()
    }
}


// See through Button
struct ClearButtonEven: ViewModifier {
    var bgColor: Color
  
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(bgColor)
            .font(.system(size: 14, weight: .regular, design: .default))
            .frame(width: 100, height: 35, alignment: .center)
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}


// See through Button
struct ClearButtonStyleSmall: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .foregroundColor(bgColor)
            .padding(.leading, 12)
            .padding(.trailing, 12)
            .padding(.all, 7)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}

// See through Button
struct ClearButtonStyleLarge: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .foregroundColor(bgColor)
            .padding(.leading, 102)
            .padding(.trailing, 102)
            .padding(.all, 14)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}
