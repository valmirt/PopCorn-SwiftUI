//
//  DoubleExtension.swift
//  PopCorn-SwiftUI
//
//  Created by Valmir Junior on 11/05/21.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
