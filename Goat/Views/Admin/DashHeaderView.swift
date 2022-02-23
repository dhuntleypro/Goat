//
//  DashHeaderView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct DashHeaderView: View {
    
    @ObservedObject var productVM = ProductViewModel()
    @ObservedObject var collectionVM = CollectionViewModel()

    @Binding var showDashboard : Bool
    @Binding var editMode : Bool
    @State var previewingApp = false
    var body: some View {
        VStack {
            
            HStack {
                Button(action: {
                    productVM.fetchProducts()
                    collectionVM.fetchCollections()
                    self.showDashboard.toggle()
                    
                }) {
                    Image(systemName: "circle.grid.cross.down.fill")
                    
                }
                
                Spacer()
                
                Button(action: {
                    self.showDashboard.toggle()
                    
                }) {
                    HStack {
                        Text(showDashboard ? "Design" : "Edit Mode")
                        Image(systemName: "chevron.down")
                    }
                }
                
                
                Spacer()
                
                
                NavigationLink(destination: MainTabView(previewingApp: previewingApp)) {
                    Image(systemName: "eye")
                    
                }
                .simultaneousGesture(TapGesture().onEnded{
                    self.editMode = false
                    self.previewingApp = true
                })
                
            }
            .padding(.horizontal)
            .foregroundColor(.white)
//            .frame(height: 50)
            Spacer()
        }
    }
}

struct DashHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DashHeaderView(showDashboard: .constant(false), editMode: .constant(false))
            .background(Color.blue)
    }
}
