//
//  Modifiers.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct Modifiers: View {
    @State var want = false
    var body: some View {
        VStack(spacing: 20) {
            
            Group {
                
                Button(action: {}, label: {
                    Text("Clear")
                })
                .modifier(myClearButton60BY35(textColor: .white, bgColor: .black))
                
                Button(action: {}, label: {
                    Text("Clear")
                })
                .modifier(myClearButton70BY35(bgColor: .black))
                
                
                Button(action: {}, label: {
                    Text("Clear")
                })
              .modifier(myClearButton100BY35(bgColor: .black))
    
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Clear")
                })
                .modifier(myClearButton200BY45(bgColor: .black))

                
                
                
                Button(action: {}, label: {
                    Text("Clear")
                })
                .modifier(myClearButton300BY45(bgColor: .black))
                
                
            }
          
            
            
            TwoRowButton(textOne: "Standard: $12", textTwo: "The item will be shipped within 24 hours")
            
            Group {
                // BLACK
                Button(action: {}, label: {
                    Text("Black")
                })
                .modifier(myFillButton60BY35(bgColor: .black, txtColor: .white))
                
                Button(action: {}, label: {
                    Text("Black")
                })
                .modifier(myFillButton70BY35(bgColor: .black, txtColor: .white))
                
                Button(action: {}, label: {
                    Text("Black")
                })
                .modifier(myFillButton100BY35(bgColor: .black, txtColor: .white))
                
                Button(action: {}, label: {
                    Text("Black")
                })
                .modifier(myFillButton200BY35(bgColor: .black, txtColor: .white))
                
             
                
                Button(action: {}, label: {
                    Text("Checkout")
                })
                .modifier(myFillButton300BY45(bgColor: .black))
                
                Button(action: {
                    want.toggle()
                }, label: {
                    Text("Wkkkant")
                        .modifier(want ? myFillSwitchButton80BY35(black: false) : myFillSwitchButton80BY35(black: true))
                    
                })
                
               
                
            }
           
            
          
        }
        
        
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        Modifiers()
        // TwoRowButton(textOne: "Standard: $12", textTwo: "The item will be shipped within 24 hours")
    }
}


struct TwoRowButton : View {
    
    var textOne : String
    var textTwo : String
    var body: some View {
        VStack(alignment: .leading ) {
            Text(textOne)
                .foregroundColor(.black)
                .padding(.bottom, 5)
            Text(textTwo)
            
        }

        .font(.system(size: 15))
        .foregroundColor(.black)
        .frame(width: 320, height: 75)
        .overlay(
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color.black, lineWidth: 1)
        )
     //   .modifier(myClearButton300BY45(bgColor: .black))

        
    }
    
}












// base line for corrections
struct myClearButton60BY35: ViewModifier {
    var textColor : Color
    var bgColor: Color
  
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(textColor)
            .font(.system(size: 12, weight: .regular, design: .default))
            .frame(width: 50, height: 20, alignment: .center)
            .contentShape(Rectangle())
            .background(bgColor)
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(textColor, lineWidth: 1).opacity(0.5)
            )
    }
}



// USE THESE
// See through Button
struct myClearButton70BY35: ViewModifier {
    var bgColor: Color
  
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(bgColor)
            .font(.system(size: 14, weight: .regular, design: .default))
            .frame(width: 70, height: 35, alignment: .center)
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}




// See through Button
struct myClearButton100BY35: ViewModifier {
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
struct myClearButton150BY35: ViewModifier {
    var bgColor: Color
  
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 14, weight: .regular, design: .default))
            .frame(width: 150, height: 35, alignment: .center)
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}



// See through Button
struct myClearButton200BY45: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .foregroundColor(bgColor)
            .frame(width: 200, height: 45)
 
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}



// See through Button
struct myClearButton300BY45: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .foregroundColor(bgColor)
            .frame(width: 300, height: 45)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}



// See through Button
struct myClearButton380BY45: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .foregroundColor(bgColor)
            .frame(width: 380, height: 45)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}













// FILLS

struct myFillButton60BY35: ViewModifier {
    var bgColor: Color
    var txtColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(txtColor)
            .font(.system(size: 12, weight: .regular, design: .default))
            .frame(width: 60, height: 35, alignment: .center)
            .background(bgColor)
            .cornerRadius(4)
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}


struct myFillButton70BY35: ViewModifier {
    var bgColor: Color
    var txtColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(txtColor)
            .font(.system(size: 12, weight: .regular, design: .default))
            .frame(width: 70, height: 35, alignment: .center)
            .background(bgColor)
            .cornerRadius(4)
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}




struct myFillButton100BY35: ViewModifier {
    var bgColor: Color
    var txtColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(txtColor)
            .font(.system(size: 14, weight: .regular, design: .default))
            .frame(width: 100, height: 35, alignment: .center)
            .background(bgColor)
            .cornerRadius(4)
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}




struct myFillButton200BY35: ViewModifier {
    var bgColor: Color
    var txtColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(txtColor)
            .font(.system(size: 14, weight: .regular, design: .default))
            .frame(width: 200, height: 35, alignment: .center)
            .background(bgColor)
            .cornerRadius(4)
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}




// Black Checkout *
struct myFillButton300BY45: ViewModifier {
    var bgColor: Color
  
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .semibold, design: .default))
            .frame(width: 300, height: 45, alignment: .center)
            .contentShape(Rectangle())
            .background(bgColor)
            .cornerRadius(6)

            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}




// white to Black  Button *
struct myFillSwitchButton80BY35: ViewModifier {
    var black: Bool
  
    func body(content: Content) -> some View {
        content
            .foregroundColor(black ? .white : .black)
            .font(.system(size: 10, weight: .regular, design: .default))
            .frame(width: 80, height: 35, alignment: .center)
            .contentShape(Rectangle())
            .background(Color(black ? .black : .white))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(black ? Color.black : Color.black, lineWidth: 1)
            )
    }
}










// white to Black  Button *
struct myWhiteToBlackButtonMid: ViewModifier {
    var black: Bool
  
    func body(content: Content) -> some View {
        content
            .foregroundColor(black ? .white : .black)
            .font(.system(size: 13, weight: .regular, design: .default))
            .frame(width: 80, height: 30, alignment: .center)
            .contentShape(Rectangle())
            .background(Color(black ? .black : .white))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(black ? Color.black : Color.black, lineWidth: 1)
            )
    }
}

// white to Black  Button *
struct myWhiteToGreenButtonMid: ViewModifier {
    var green: Bool
    
  
    func body(content: Content) -> some View {
        content
            .foregroundColor(green ? .black : .black)
            .font(.system(size: 13, weight: .regular, design: .default))
            .frame(width: 80, height: 30, alignment: .center)
            .contentShape(Rectangle())
            .background(Color(green ? .green : .white))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(green ? Color.black : Color.black, lineWidth: 1)
            )
    }
}




struct MyClearAppleButton: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.system(size: 16, weight: .semibold
                          , design: .rounded))
            .frame(width: 200, height: 50)
            .background(Color.white)
            .contentShape(Rectangle())
            .cornerRadius(6)
            .overlay(
                VStack {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(bgColor, lineWidth: 0.6)
                }
            )
    }
}


struct myButtonStyleSmall: ViewModifier {
    var prime: Color
    var myBackground: Color

    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .foregroundColor(prime)
            .frame(width: 100, height: 35)
            .cornerRadius(3)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(myBackground, lineWidth: 1)
            )
            .background(myBackground)
    }
}








