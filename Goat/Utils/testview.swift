//
//  testview.swift
//  Goat
//
//  Created by Darrien Huntley on 1/25/21.
//

import SwiftUI

struct testview: View {
    var body: some View {
        
       
        // wide image == wide
        Image("collection-bg-1")
            .resizable()
            .scaledToFill() // or .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width, height: 300)
        
        // long image == wide
        Image("collection-bg-2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width, height: 300)
            .clipShape(Rectangle())


    }
}

struct testview_Previews: PreviewProvider {
    static var previews: some View {
        testview()
    }
}
