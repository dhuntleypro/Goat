//
//  SettingsView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            NavigationLink(destination: UserPaymentView()) {
                Text("Account Payment")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
