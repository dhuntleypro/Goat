//
//  CustomSegmentedView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

// Options | Custom Picker view
enum CustomSegmentedOptions: Int , CaseIterable {
    // with Int (array Int) - it assigns each case a value starting for 0 like an array
    case Discover
    case Calender
 //   case Favorites
    var title: String {
        switch self {
        
        case .Discover: return "Discover"
        case .Calender: return "Calender"
   //     case .Favorites: return "Favorites"
        }
    }
}

struct CustomSegmentedView: View {
    @Binding var selectedOption: CustomSegmentedOptions
   // @Binding var showDashboard : Bool

    @Binding var SlideGesture : CGSize
    @Binding var SlideOne : Bool
    @Binding var SlideTwo : Bool
    
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(CustomSegmentedOptions.allCases.count)
    
    private var padding :CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue) //
        let count = CGFloat(CustomSegmentedOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue ) + 16
        // ((total width of the screen / number of cases) * the array Int ) + 16 padding
    }

    var body: some View {
        VStack(alignment: .leading) {
            
//            if showDashboard == true {
//                Spacer().frame(height: 500)
//            }
            
            HStack {
                ForEach(CustomSegmentedOptions.allCases, id: \.self) {  option in
                    Button(action: {
                        self.selectedOption = option
                        SlideOne.toggle()
                        SlideTwo.toggle()
                    }, label: {
                        Text(option.title)
                            .font(.system(size: 14))
                            .frame(width: underlineWidth - 5) // 8
                            
                            
                    })
                }
            }
            .foregroundColor(.white)
            
            VStack {
                ZStack {
                    // Divider()
                    
                    Rectangle()
                        .frame(width: underlineWidth - 32, height: 3 , alignment: .center)
                        .foregroundColor(.white)
                        .padding(.leading, padding)
                        .animation(.spring())
                }
            }


            
        }
        .padding(.top)
        .background(Color.black)

    //    .foregroundColor(.black)


    }
}

//struct CustomSegmentedView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSegmentedView(selectedOption: .constant(.Discover))
//    }
//}
//
