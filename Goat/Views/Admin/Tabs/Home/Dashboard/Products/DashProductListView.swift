//
//  DashProductListView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct DashProductListView: View {
    @ObservedObject var productVM = ProductViewModel()
    
    
    @Binding var showUploadView : Bool
    
    
    
    @State var isShowingNewProductView = false
    
    private func delayFetch() {
        // Delay of 2.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            productVM.fetchProducts()
            
        }
    }
    
    func printLine() -> String {
        let filename = "OOMA CC Temp.txt"
        var str1: String
        var myCounter: Int
        do {
            let contents = try String(contentsOfFile: filename)
            let lines = contents.split(separator:"\n")
            myCounter = lines.count
            str1 = String(myCounter)
        } catch {
            return (error.localizedDescription)
        }
        print(str1)
        
        return str1
    }
    
    
    
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Text("Products")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                        
                    
                    NavigationLink(destination: ProductListView()) {
                        Image(systemName: "doc.plaintext.fill")
                            .font(.system(size: 23, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    HStack {
                        
                        Button(action: {
                            //   self.isShowingNewProductView.toggle()
                            self.showUploadView.toggle()
                        }) {
                            Image(systemName: "square.and.arrow.down.fill")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                        }
                        
                        
                        
                        
                        Button(action: {
                            self.isShowingNewProductView.toggle()
                            
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .foregroundColor(.black)
                        }
                        .fullScreenCover(isPresented: $isShowingNewProductView ,  onDismiss: delayFetch) {
                            CreateProductView(isPresented: $isShowingNewProductView)
                        }
                    }
                }
                .padding()
                
                // List of Products
                ScrollView(.horizontal , showsIndicators: true){
                    
                    HStack {
                        
                        ForEach(productVM.products) { product in
                           
                                NavigationLink(destination: EditProductView(
                                    id: product.id,
                                    name : product.name,
                                    description: product.description,
                                    isAdded : product.isAdded,
                                    cost : String(product.cost),
                                    likes : String(product.likes),
                                    taxed: product.taxed,
                                    variantItem : product.variantItem,
                                    size: product.size,
                                    sizePricing : product.sizePricing,
                                    sizeQuantity : product.sizeQuantity,
                                    quantity : String(product.quantity),
                                    onSale: product.onSale,
                                    onSalePrice : String(product.onSalePrice),
                                    tags : product.tags,
                                    brand : product.brand,
                                    category : product.category,
                                    sku : product.sku,
                                    mainColor : product.mainColor,
                                    want : product.want,
                                    releaseDate : product.releaseDate,
                                    images : product.images,
                                    onAppImages: product.onAppImages,
                                    soldOut : product.soldOut,
                                    active: product.active,
                                    product: product
                                )) {
                                    ProductCell01(product: product)
                            }
                            
                           // Divider().frame(width: 50)
                        }
                        
                        
                    }
                    .padding(.leading)
                }
            }
        }
        .onAppear() {
            productVM.fetchProducts()
        }
    }
}

//struct DashProductListView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashProductListView()
//    }
//}
