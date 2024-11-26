//
//  InnerRing.swift
//  FitKid
//
//  Created by 冯悦妍 on 2023/6/20.
//

import SwiftUI

struct RingShape: Shape {
    
    var progress:Double = 0.0
    var thickness:CGFloat = 30.0
    var startAngle:Double = -90.0
    
    func path(in rect:CGRect) -> Path {
        var path=Path()
        path.addArc(center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0), radius: min(rect.width,rect.height) / 2.0, startAngle: .degrees(startAngle), endAngle: .degrees(360 * progress + startAngle), clockwise: false)
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
    }
}

struct RingShape_Previews: PreviewProvider {
    static var previews: some View {
        RingShape()
    }
}
