//
//  BackButton.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/10/21.
//

import SwiftUI

struct BackButton: View {
    let label: String
    let closure: () -> ()

    var body: some View {
        Button(action: { self.closure() }) {
            HStack {
                Image(systemName: "chevron.left")
                Text(label)
            }
        }
    }
}

