//
//  Fit_Kid__use_podApp.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/9.
//

import SwiftUI

@main
struct Fit_Kid__use_podApp: App {
    var body: some Scene {
        WindowGroup {
            TabLayoutView()
                .environmentObject(Choose3DModelData())
                .environmentObject(CaloriesFakeData())
            //FitKidQuickPoseView()
            //ARRobotView()
//           ChartView()
//                .environmentObject(CaloriesFakeData())
//            AllRowCaloriesFakeDataView()
//                .environmentObject(CaloriesFakeData())
//                .environmentObject(Choose3DModelData())
//                testViewToSwiftUI()
//            AllSportView()
//                .environmentObject(Choose3DModelData())
//                .environmentObject(CaloriesFakeData())
            //SportView_paiming()
        }
    }
}
