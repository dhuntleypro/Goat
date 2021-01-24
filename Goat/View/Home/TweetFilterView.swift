//
//  TweetFilterView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

// Options | Custom Picker view
enum TweetFilterOptions: Int , CaseIterable {
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

struct FilterButtonView: View {
    @Binding var selectedOption: TweetFilterOptions
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
    
    private var padding :CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue) //
        let count = CGFloat(TweetFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue ) + 16
        // ((total width of the screen / number of cases) * the array Int ) + 16 padding
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(TweetFilterOptions.allCases, id: \.self) {  option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .font(.system(size: 14))
                            .frame(width: underlineWidth - 5) // 8
                            
                            
                    })
                }
            }
            .foregroundColor(.white)
            
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3 , alignment: .center)
                .foregroundColor(.white)
                .padding(.leading, padding)
                .animation(.spring())
        }
        .foregroundColor(.white)

    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOption: .constant(.Discover))
    }
}

