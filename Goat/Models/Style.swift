//
//  Style.swift
//  Goat
//
//  Created by Darrien Huntley on 1/23/21.
//



import SwiftUI

struct Style: Identifiable {
    let id: Int
    let title: String
    let caption: String
    let description: String
    let image: String
    let images: [String]
    let price: Double // total of all items
    let tags: [String]
    var want: Bool
    let brand : String
    let category : String
    let colorway : String
    let sku : String
    let releaseDate : String
    let modelImage: String // for style view
    let modelImages: [String] // for style view
    let isCurrentUser: Bool
    
    
    //// create product Variants
    // let name: String // Small , Medium
    //let image: String
    //let price: Double
    //let colorway : String
    //let sku : String
    //let isCurrentUser: Bool

}

// Data source

let MOCK_STYLE: [Style] = [
    .init(id: 0,
          title: "Air Jordan 13 Retro 'Starfish'",
          caption: "ff",
          description: "The Air Jordan 13 Retro ‘Starfish’ features a familiar color palette that recalls the ‘Shattered Backboard’ editions of the Air Jordan 1. The upper combines a white tumbled leather base with orange suede paneling and signature dimpled overlays in more white leather. Traditional branding elements include an embroidered Jumpman atop the tongue and the 13's holographic eye on the lateral ankle. A contrasting black finish is applied to the panther-paw outsole.",
          image: "660244_01",
          images: [
            "660244_01",
            "660244_02",
            "660244_03",
            "660244_04",
            "660244_05",
            "660244_06",
            "660244_07",
            "660244_08"
          ],
          price: 310.0,
          tags: ["2020", "Our Favorites", "Just Dropped" ],
          
          want: false,
          brand : BRAND_NAME,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          releaseDate : "02/02/2021",
          modelImage: "model-1",
          modelImages: [ "model-1",  "model-2",  "model-3"],

          isCurrentUser: false
    ),
    
    .init(id: 1,
          title: "Air Jordan 13 Retro 'Starfish'",
          caption: "ff",
          description: "The Air Jordan 1 Retro High OG ‘Volt Gold’ gives the iconic model a subtle makeover that takes its design cues from previous Air Jordan 1 colorways. Unique details include a reversed translucent tag on an exposed foam tongue and detached collar flaps in an eye-catching shade of Volt. The rest of the leather upper is rendered in tri-tonal color blocking, featuring a crisp white base with contrasting black forefoot overlays and a heel panel in University Gold.",
          image: "602213_01",
          images: [
            "602213_01",
            "602213_02",
            "602213_03",
            "602213_04",
            "602213_05",
            "602213_06",
            "602213_07",
            "602213_08"
          ],
          price: 110.0,
          tags: ["Just Dropped", "2020"],
          
          want: false,
          brand : BRAND_NAME,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          releaseDate : "02/02/2021",
          modelImage: "model-2",
          modelImages: [ "model-1",  "model-2",  "model-3"],
          isCurrentUser: false
    ),
    
    .init(id: 2,
          title: "Air Jordan 13 Retro 'Starfish'",
          caption: "ff",
          description: "The Notre x Nike Dunk High ‘Midnight Navy’ draws inspiration from the Chicago-based retailer’s midwestern roots and community-driven ethos. The design of the high-top takes its cues from classic workwear, highlighted by a pale indigo leather upper with shaggy suede overlays and breathable canvas on the medial side panel. Utilitarian details include triple stitch detailing, a webbing pull tab and an embroidered Notre name patch atop the left tongue. The store’s signature linked hands logo is integrated into the medial-side Swoosh.",
          image: "718884_01",
          images: [
            "718884_01",
            "718884_02",
            "718884_03",
            "718884_04",
            "718884_05",
            "718884_06",
            "718884_07",
            "718884_08"
          ],
          price: 320.0,
          tags: ["Just Dropped" ],
          want: false,
          brand : BRAND_NAME,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          releaseDate : "02/02/2021",
          modelImage: "model-3",
          modelImages: [ "model-1",  "model-2",  "model-3"],
          isCurrentUser: false
    ),
    
    .init(id: 3,
          title: "Air Jordan 13 Retro 'Starfish'",
          caption: "ff",
          description: "adidas and Disney, powerhouses in their own fields, combined forces to revamp kids’-sized versions of some the Three-Stripes brand’s top models inspired from Pixar’s popular Toy Story film series. Dropped in June 2019, the Toy Story 4 x NMD_R1 Kids 'Bo Peep' sneaker is dressed in a pastel-colored stretch knit upper, detailed with a Bo Peep sockliner, as well as a polka dot Boost sole with the character’s name.",
          image: "EG7316",
          images: [
            "EG7316"
          ],
          price: 220.0,
          tags: ["Our Favorites"],
          want: false,
          brand : BRAND_NAME,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          releaseDate : "02/02/2021",
          modelImage: "model-4",
          modelImages: [ "model-1",  "model-2",  "model-3"],
          isCurrentUser: false
    ),
    
    .init(id: 4,
          title: "Air Jordan 13 Retro 'Starfish'",
          caption: "ff",
          description: "The women’s Air Jordan 4 Retro ‘Starfish’ updates the classic silhouette with a unique build inspired by an astronaut’s spacesuit. Black metallic mesh covers the upper, contrasted by Starfish orange underlays that stand out via the sneaker’s raw-edge construction. Matte black distinguishes the TPU wings and heel tab, accented with a raised Jumpman in light grey. A second Jumpman adorns the woven tag stitched atop an exposed-foam tongue. Underfoot, the rubber outsole is accented with additional pops of Starfish under the toe and heel.",
          image: "680720_01",
          images: [
            "680720_01",
            "680720_02",
            "680720_03",
            "680720_04",
            "680720_05",
            "680720_06",
            "680720_07",
            "680720_08",
          ],
          price: 110.0,
          tags: ["Our Favorites", "Most Popular" , "Winter 2021"],
          want: false,
          brand : BRAND_NAME,
          category : "sneakers",
          colorway : "black",
          sku : "001",
          releaseDate : "02/02/2021",
          modelImage: "model-5",
          modelImages: [ "model-1",  "model-2",  "model-3"],
          isCurrentUser: false
    ),
]
