//
//  Extension+Price.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//

import SwiftUI
import Foundation

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

extension Double {
    var cleanCurrency: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.2f", self) : String(self)
    }
}

extension Float {
    var cleanFloat: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
