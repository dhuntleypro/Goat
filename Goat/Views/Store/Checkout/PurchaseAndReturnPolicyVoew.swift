//
//  PurchaseAndReturnPolicyView.swift
//  OurStore
//
//  Created by Darrien Huntley on 5/26/21.
//

import SwiftUI

struct PurchaseAndReturnPolicyView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Purchase And Return Policy")

            Spacer()
        }
    }
}

struct PurchaseAndReturnPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseAndReturnPolicyView()
    }
}
