//
//  Constant.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/12.
//

import Foundation
import SwiftUI

let foods: [Food] = Bundle.main.decode("food.json")
let colorBackground = Color ("ColorBackground")
let colorGray = Color (UIColor.systemGray4)
let sampleFood: Food = foods[0]
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
