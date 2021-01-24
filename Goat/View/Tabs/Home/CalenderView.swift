//
//  CalenderView.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//

import SwiftUI

struct CalenderView: View {
    var body: some View {
        VStack {
            // search bar
            
            ScrollView(.vertical, showsIndicators: false) {
                
                ProductCell02Loop()
                
            }
            
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        CalenderView()
            
        }
    }
}
