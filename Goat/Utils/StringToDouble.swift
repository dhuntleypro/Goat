//
//  StringToDouble.swift
//  OurStore
//
//  Created by Darrien Huntley on 4/28/21.
//


import SwiftUI


func possible_stringToDouble(_ stringToValidate:String) -> Double?{
    let val:Double? = Double(stringToValidate) ?? nil
    
    if let val = val {
        return val
    } else {
        return nil
    }
    
}


