//
//  Choose3DModel.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/10.
//

import Foundation



class Choose3DModelData : ObservableObject
{
    @Published var tDModelNameToChoose : String = "robot_walk_idle.usdz"
    @Published var height : String = "130"
    @Published var heavy : String = "40"
    @Published var issport : Bool = false
    @Published var sportname : String = "开合跳"
    @Published var sportIntroduceName : String = "仰卧起坐"
    @Published var isshowsportIntroducename : Bool = false
    @Published var isshowAllRowCaloriesFakeDataView : Bool = false
    @Published var setTime : Int = 120
    @Published var isshowChartView : Bool = false
    @Published var isshowsportitemView : Bool = false
}
