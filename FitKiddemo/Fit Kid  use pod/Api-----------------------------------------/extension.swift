//
//  extension.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/16.
//
import Foundation
import SwiftUI
import QuickPoseCore
import QuickPoseCamera
import QuickPoseSwiftUI

extension QuickPose.Feature {
    public static func allDemoFeatures(component: String) -> [[QuickPose.Feature]] {
        if component == "Measurement" {
            return [
                [.measureLineBody(p1: .userLeftShoulder, p2: .userRightShoulder, userHeight: nil, format: nil)],
                [.measureLineBody(p1: .userLeftShoulder, p2: .userRightShoulder, userHeight: 100, format: "%.fcm")],
                ]
        } else if component == "Health" {
            return [[.rangeOfMotion(.shoulder(side: .left, clockwiseDirection: false))], [.rangeOfMotion(.shoulder(side: .right, clockwiseDirection: true))],
                    [.rangeOfMotion(.hip(side: .right, clockwiseDirection: true))], [.rangeOfMotion(.knee(side: .right, clockwiseDirection: true))], [.rangeOfMotion(.neck(clockwiseDirection: false))], [.rangeOfMotion(.back(clockwiseDirection: false))]]
        } else if component == "Input" {
            return [[QuickPose.Feature.raisedFingers()], [QuickPose.Feature.thumbsUp()], [QuickPose.Feature.thumbsUpOrDown()]]
        } else if component == "Conditional" {
            let greenStyle = QuickPose.Style(conditionalColors: [QuickPose.Style.ConditionalColor(min: 40, max: nil, color: UIColor.green)])
            let redStyle = QuickPose.Style(conditionalColors: [QuickPose.Style.ConditionalColor(min: 180, max: nil, color: UIColor.red)])
            return [[.rangeOfMotion(.shoulder(side: .left, clockwiseDirection: false), style: greenStyle)], [.rangeOfMotion(.knee(side: .right, clockwiseDirection: true), style: redStyle)]]
        } else if component == "Fitness" {
            return [
                [.fitness(.squats)],
                [.fitness(.pushUps)],
                [.fitness(.jumpingJacks)],
                [.fitness(.sumoSquats)],
                [.fitness(.lunges(side:.left))],
                [.fitness(.lunges(side:.right))],
                [.fitness(.sitUps)],
                [.fitness(.cobraWings)],
                [.fitness(.plank)],
                [.fitness(.bicepCurls)],
                [.fitness(.lateralRaises)],
                [.fitness(.frontRaises)]
            ]
        } else if component == "Sports" {
            let bikeStyle = QuickPose.Style(relativeFontSize: 0.33, relativeArcSize: 0.4, relativeLineWidth: 0.3)
            let feature1: QuickPose.Feature = .rangeOfMotion(.shoulder(side: .right, clockwiseDirection: false), style: bikeStyle)
            let feature2: QuickPose.Feature = .rangeOfMotion(.elbow(side: .right, clockwiseDirection: false), style: bikeStyle)
            let feature3: QuickPose.Feature = .rangeOfMotion(.hip(side: .right, clockwiseDirection: false), style: bikeStyle)
            let feature4: QuickPose.Feature = .rangeOfMotion(.knee(side: .right, clockwiseDirection: true), style: bikeStyle)
            return [[feature1,  feature2, feature3, feature4]]
        } else {
            return QuickPose.Landmarks.Group.commonLimbs().map { [QuickPose.Feature.overlay($0)] } + [[QuickPose.Feature.showPoints()]]
        }
    }
    
    public static func allDemoFeatureComponents() -> [String] {
        return ["General", "Input", "Fitness", "Health", "Conditional", "Sports", "Measurement"]
    }
}


extension JiHuaRowView
{
    
    func chooseColor(it : Int) -> Color
    {
        var a = it / 4
        switch it
        {
        case 0:
            return .red
            break
        case 1:
            return .blue
            break
        case 2:
            return .orange
            break
        default:
            return .green
        }
    }
}
