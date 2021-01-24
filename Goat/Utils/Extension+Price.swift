//
//  Extension+Price.swift
//  Goat
//
//  Created by Darrien Huntley on 1/24/21.
//

import SwiftUI
import Foundation

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
