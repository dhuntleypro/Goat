//
//  StyleImageCell.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct StyleImageCell: View {
    var style : Style
    var body: some View {
        VStack {
            ZStack {
                Image(style.image)
                    .resizable()
                    .scaledToFit()
                    .overlay(Color(.black).opacity(0.1))
                    .frame(width: UIScreen.main.bounds.width, height: 580)
                
                VStack {
                    Text(style.title)
                        .font(.system(size: 33 , weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(style.caption)
                        .font(.system(size: 23 , weight: .semibold))
                        .foregroundColor(.gray)
                }
                
            }

        }
    }
}

//struct StyleProductCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StyleProductCell()
//    }
//}
