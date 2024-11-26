//
//  FoodModel.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/12.
//

import Foundation

struct Food: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let caloric: Int
    let description: String
    let color: [Double]
    
    var red: Double { color[0] }
    var green: Double { color[1] }
    var blue: Double { color[2] }
    
    var formattedCaloric: String { "\(caloric)  大卡"}
}
