//
//  DashboardContentView.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI

struct DashboardContentView: View {
    @ObservedObject var productVM : UploadProductViewModel
    @ObservedObject var collectionVM : UploadCollectionViewModel

    @Binding var isPresented : Bool
    
    @State var showUploadView = false
    
    
    // dismiss view on completion of new product being added
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
        self.productVM = UploadProductViewModel(isPresented: isPresented)
        self.collectionVM = UploadCollectionViewModel(isPresented: isPresented)

    }
    
    
    var body: some View {
        ZStack {
            VStack {
                DashContentHeaderView()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        
                       
                        
                        DashContentSliderView()
                        
                        DashProductListView(showUploadView: $showUploadView)
                        
                        DashCollectionListView()
                        
                        Spacer().frame(height: 150)
                        
                    }
                }
            }
           
           
            
            if showUploadView == true {
                ZStack {
                    Text("f")
                }
                .frame(width: 400, height: 600)
                .background(Color.white).opacity(0.8)
                .blur(radius: 10)
                
                ZStack {
                    //                    Color.white.opacity(0.2).edgesIgnoringSafeArea(.all)
                    //                        .blur(radius: 20)
                    VStack {
                        HStack {
                            Text("Upload")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .padding()
                            
                            Spacer()
                            
                            Button(action: {
                                
                                self.showUploadView.toggle()
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.title2)
                            }
                            .padding()
                            
                        }
                        VStack {
                            Button(action: {
                                
//                                let docRef = COLLECTION_PRODUCTS.document()
                                
                                
                                // 1
                                productVM.uploadProduct(
                                    id: UUID().uuidString,
                                    name: "Aruba & Grey Lighting Tie Dye Cap",
                                    description: "Adjustable Buckle Closure 100% Washed Cotton 6-Panel, Unconstructed Vintage Washed Look Low Crown",
                                    isAdded: false,
                                    cost: 90,
                                    likes: 0,
                                    taxed: true,
                                    variantItem: false,
                                    size: ["one size"],
                                    sizePricing: [90],
                                    sizeQuantity: [7],
                                    quantity : 0,
                                    onSale: false,
                                    onSalePrice: 50,
                                    tags: ["new" , "just added"],
                                    brand: "Yaw Denim",
                                    category: "accessories",
                                    sku: "1021",
                                    mainColor: "teal",
                                    want: false,
                                    releaseDate: "04|02|2020",
                                    onAppImages: ["product1"],
                                    images: [],
                                    soldOut: false,
                                    active: true
                                )
                                
                                // 2
                                productVM.uploadProduct(
                                    
                                    id: UUID().uuidString,
                                    name: "Black and White lightning tie dye thermal with Denim Appliqué",
                                    description: """
Handmade to ensure a great fit with an iconic and eye-catching denim appliqué yaw logo.
                                    
                                    

                                    – unisex
                                    – made in the USA
                                    – 4.3 oz fine jersey
                                    – do not wash
                                    – dry clean only
                                    – 100% cotton
""",
                                    isAdded: false,
                                    cost: 115.00,
                                    likes: 0,
                                    taxed: true,
                                    variantItem: false,
                                    size: ["XS" , "S" , "M" , "L" , "2XL", "3XL" , "4XL"],
                                    sizePricing :  [ 115.00 ,115.00 , 115.00 ,115.00 ,115.00 ,115.00 ,115.00  ],
                                    sizeQuantity : [ 2 , 2 , 2 , 2 , 2 , 2 , 2 ],
                                    quantity : 0,

                                    onSale: false,
                                    onSalePrice: 100,
                                    tags: ["new" , "just added"],
                                    brand: "Yaw Denim",
                                    category: "men",
                                    sku: "1021",
                                    mainColor: "teal",
                                    want: false,
                                    releaseDate: "04|02|2020",
                                    onAppImages: ["product2"],
                                    images: [],
                                    soldOut: false,
                                    active: true
                                )
                                
                                
                                // 3
                                productVM.uploadProduct(
                                    
                                    
                                    id: UUID().uuidString,
                                    name: "Black Socks",
                                    description: """
Reflective (glow in the dark) Yaw outline embroidery
- available in black, white, royal, coral, mauve, and clear blue
- Made in the U.S.A.
- 100% U.S. Cotton Crew Socks
""",
                                    isAdded: false,
                                    cost: 30.00,
                                    likes: 0,
                                    taxed: true,
                                    variantItem: false,
                                    size: ["one size"],
                                    sizePricing :  [30],
                                    sizeQuantity : [8],
                                    quantity : 0,
                                    onSale: false,
                                    onSalePrice: 20,
                                    tags: ["featured" , "men"],
                                    brand: "Yaw Denim",
                                    category: "men",
                                    sku: "1021",
                                    mainColor: "teal",
                                    want: false,
                                    releaseDate: "04|02|2020",
                                    onAppImages: ["product3"],
                                    images: [],
                                    soldOut: false,
                                    active: true
                                )
                                
                                
                                
                                
                                // 4
                                productVM.uploadProduct(
                                    
                                    id: UUID().uuidString,
                                    name: "Blue Tie Dye Face Mask",
                                    description: "Tie-Dye Face Mask",
                                    isAdded: false,
                                    cost: 30,
                                    likes: 0,
                                    taxed: true,
                                    variantItem: false,
                                    size: ["one size"],
                                    sizePricing :  [30],
                                    sizeQuantity : [8],
                                    quantity : 0,

                                    onSale: false,
                                    onSalePrice: 20,
                                    tags: ["featured" , "covid"],
                                    brand: "Yaw Denim",
                                    category: "men",
                                    sku: "1021",
                                    mainColor: "teal",
                                    want: false,
                                    releaseDate: "04|02|2020",
                                    onAppImages: ["product4"],
                                    images: [],
                                    soldOut: false,
                                    active: true
                                )
                                
                                
                                // 5
                                productVM.uploadProduct(
                                    
                                    id: UUID().uuidString,
                                    name: "Men Aruba and Grey Lightning Shorts",
                                    description: """
Handmade to ensure a great fit with an iconic and eye-catching lighting design.

- Unisex
- Made in the U.S.A.
- Pre-Washed for a no-shrink true fit.
- 14 oz/yd2 Super Heavy Weight Shrink Free

100% U.S. Cotton
Heather: 98% Cotton / 2% Polyester
""",
                                    isAdded: false,
                                    cost: 95,
                                    likes: 0,
                                    taxed: true,
                                    variantItem: false,
                                    size: ["XS" , "S" , "M" , "L" , "2XL", "3XL" , "4XL"],
                                    sizePricing :  [ 95.00 , 95.00 , 95.00 ,95.00 ,95.00 ,95.00 ,95.00 ,95.00 ,95.00],
                                    sizeQuantity : [ 0 , 1 , 1 , 0 , 0 , 0 , 0 ],
                                    quantity : 0,

                                    onSale: false,
                                    onSalePrice: 20,
                                    tags: ["men" , "just added"],
                                    brand: "Yaw Denim",
                                    category: "men",
                                    sku: "1021",
                                    mainColor: "teal",
                                    want: false,
                                    releaseDate: "04|02|2020",
                                    onAppImages: ["product5"],
                                    images: [],
                                    soldOut: false,
                                    active: true
                                )
                                
                                // 6
                                productVM.uploadProduct(
                                    
                                    id: UUID().uuidString,
                                    name: "Men Aruba and Grey Lightning Crewneck",
                                    description: """
Handmade to ensure a great fit with an iconic and eye-catching Yaw bullseye design on the back.
- Unisex
- Made in the U.S.A.
- Pre-Washed for a no-shrink true fit.
- 14 oz/yd2 Super Heavy Weight Shrink Free
- Oversized Fit

100% U.S. Cotton
Heather: 98% Cotton / 2% Polyester
""",
                                    isAdded: false,
                                    cost: 175,
                                    likes: 0,
                                    taxed: true,
                                    variantItem: false,
                                    size: ["XS" , "S" , "M" , "L" , "2XL", "3XL" , "4XL"],
                                    sizePricing :  [ 175.00 ,175.00 , 175.00 , 175.00 , 175.00 , 175.00 , 175.00 ],
                                    sizeQuantity : [ 0 , 2 , 2 , 0 , 1 , 2 , 0 ],
                                    quantity : 0,

                                    onSale: false,
                                    onSalePrice: 20,
                                    tags: ["new" , "men"],
                                    brand: "Yaw Denim",
                                    category: "men",
                                    sku: "1021",
                                    mainColor: "teal",
                                    want: false,
                                    releaseDate: "04|02|2020",
                                    onAppImages: ["product6"],
                                    images: [],
                                    soldOut: false,
                                    active: true
                                )
                                    
                                    
                                    
                                    
                                
                                
                                // 7
                                productVM.uploadProduct(
                                    id: UUID().uuidString,
                                    name: "Men Royal Blue and Burgundy Lightning Shorts",
                                    description: """
Handmade to ensure a great fit with an iconic and eye-catching lighting design.

- Unisex
- Made in the U.S.A.
- Pre-Washed for a no-shrink true fit.
- 14 oz/yd2 Super Heavy Weight Shrink Free

100% U.S. Cotton
Heather: 98% Cotton / 2% Polyester
""",
                                    isAdded: false,
                                    cost: 95,
                                    likes: 0,
                                    taxed: true,
                                    variantItem: false,
                                    size: ["XS" , "S" , "M" , "L" , "2XL", "3XL" , "4XL"],
                                    sizePricing :  [ 95.00 ,95.00 ,95.00 ,95.00 , 95.00 , 95.00 ,95.00 ,95.00 ,95.00 ],
                                    sizeQuantity : [ 0 , 0 , 0 , 0 , 0 , 0 , 0 ],
                                    quantity : 0,

                                    onSale: false,
                                    onSalePrice: 20,
                                    tags: ["men" , "just added"],
                                    brand: "Yaw Denim",
                                    category: "men",
                                    sku: "1021",
                                    mainColor: "teal",
                                    want: false,
                                    releaseDate: "04|02|2020",
                                    onAppImages: ["product7"],
                                    images: [],
                                    soldOut: false,
                                    active: true
                                )
                                    
                                 
                                // 8
                                productVM.uploadProduct(
                                    id: UUID().uuidString,
                                    name: "Orange & White Lightning Tie Dye Cap",
                                    description: "Adjustable Buckle Closure 100% Washed Cotton 6-Panel, Unconstructed Vintage Washed Look Low Crown",
                                    isAdded: false,
                                    cost: 60.00,
                                    likes: 0,
                                    taxed: true,
                                    variantItem: false,
                                    size: [""],
                                    sizePricing :  [20],
                                    sizeQuantity : [ 1 ],
                                    quantity : 0,

                                    onSale: false,
                                    onSalePrice: 20,
                                    tags: ["new" , ""],
                                    brand: "Yaw Denim",
                                    category: "men",
                                    sku: "1021",
                                    mainColor: "teal",
                                    want: false,
                                    releaseDate: "04|02|2020",
                                    onAppImages: ["product8"],
                                    images: [],
                                    soldOut: false,
                                    active: true
                                )
                                    
                                 
                                    
                                // 9
                                productVM.uploadProduct(
                                    
                                    id: UUID().uuidString,
                                    name: "Women Green Tie Dye Dress",
                                    description: """
Slime Green and Black Lighting Tie Dye Loose Fit Pocketed Dress
""",
                                    isAdded: false,
                                    cost: 125,
                                    likes: 0,
                                    taxed: true,
                                    variantItem: false,
                                    size: ["XS" , "S" , "M" , "L" , "2XL", "3XL" , "4XL"],
                                    sizePricing :  [ 0.00 , 125.00 ,125.00 ,125.00 ,125.00 ,0.00 ,0.00  ],
                                    sizeQuantity : [ 0 , 3 , 1 , 0 , 0 , 0 , 0 ],
                                    quantity : 0,
                                    onSale: false,
                                    onSalePrice: 20,
                                    tags: ["women" , "just added"],
                                    brand: "Yaw Denim",
                                    category: "men",
                                    sku: "1021",
                                    mainColor: "teal",
                                    want: false,
                                    releaseDate: "04|02|2020",
                                    onAppImages: ["product9"],
                                    images: [],
                                    soldOut: false,
                                    active: true
                                )
                                    
                                                      
                                  
                                
                                
                                print("Product Created")
                                self.showUploadView.toggle()
                                
                            }) {
                                Text("Upload Starter Products")
                            }
                            .modifier(myFillButton200BY35(bgColor: .white, txtColor: .black))
                            .padding()
                            
                            
                            Button(action: {
                                collectionVM.uploadCollection(id: UUID().uuidString,
                                                              title: "Featured",
                                                              caption: "New",
                                                              description: "Our favorite brand new products",
                                                              amount: 0,
                                                              likes: 0,
                                                              onSale: false,
                                                              image: "collection1",
                                                              images: [""],
                                                              sequenceCount: 0,
                                                              conditions: ["featured"],
                                                              active: true
                                )
                                
                                collectionVM.uploadCollection(id: UUID().uuidString,
                                                              title: "COVID-19",
                                                              caption: "protect",
                                                              description: "Let the work speak for the creator",
                                                              amount: 0,
                                                              likes: 0,
                                                              onSale: false,
                                                              image: "collection2",
                                                              images: [""],
                                                              sequenceCount: 1,
                                                              conditions: ["covid"],
                                                              active: true
                                )
                                
                                
                                collectionVM.uploadCollection(id: UUID().uuidString,
                                                              title: "Just Dropped",
                                                              caption: "Raw",
                                                              description: "Brand new products",
                                                              amount: 0,
                                                              likes: 0,
                                                              onSale: false,
                                                              image: "collection3",
                                                              images: [""],
                                                              sequenceCount: 3,
                                                              conditions: ["new"],
                                                              active: true
                                )
                                
                                
                                collectionVM.uploadCollection(id: UUID().uuidString,
                                                              title: "Men",
                                                              caption: "human man",
                                                              description: "Products for Men",
                                                              amount: 0,
                                                              likes: 0,
                                                              onSale: false,
                                                              image: "collection4",
                                                              images: [""],
                                                              sequenceCount: 4,
                                                              conditions: ["men"],
                                                              active: true
                                )
                                
                                
                                collectionVM.uploadCollection(id: UUID().uuidString,
                                                              title: "Women",
                                                              caption: "Raw",
                                                              description: "Products for Women",
                                                              amount: 0,
                                                              likes: 0,
                                                              onSale: false,
                                                              image: "collection5",
                                                              images: [""],
                                                              sequenceCount: 5,
                                                              conditions: ["women"],
                                                              active: true
                                )
                                
                            }) {
                                Text("Upload Starter Collections")

                            }
                            .modifier(myFillButton200BY35(bgColor: .white, txtColor: .black))
                            
                        }
                        Spacer()
                    }
                    .frame(width: 300, height: 300)
                    .background(Color.black).opacity(0.9)
                    .cornerRadius(15)
                    
                }
            }
        }
        .onAppear() {
            
        }
        
    }
}

//struct DashboardContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardContentView()
//    }
//}
