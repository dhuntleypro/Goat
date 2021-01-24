//
//  StyleProductCell.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct StyleProductCell: View {
    var style : Style
    var body: some View {
        VStack {
            Image(style.image) // get from model
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 450)

        }
    }
}

//struct StyleProductCell_Previews: PreviewProvider {
//    static var previews: some View {
//        StyleProductCell()
//    }
//}
