//
//  OuterRing.swift
//  FitKid
//
//  Created by 冯悦妍 on 2023/6/20.
//

import SwiftUI

struct Ring: View {
    
    var thickness:CGFloat = 7.0
    var width:CGFloat = 60.0
    var startAngle = -90.0
    
    var body: some View {
        ZStack {
            Circle().stroke(Color(.systemGray6),lineWidth: thickness)
            RingShape(progress: 0.6, thickness: thickness).fill(AngularGradient(gradient: Gradient(colors: [.pink,.yellow]), center: .center, startAngle: .degrees(startAngle), endAngle: .degrees(360 * 0.3 + startAngle)))
        }.frame(width: width, height: width, alignment: .center)
    }
}

struct Ring_Previews: PreviewProvider {
    static var previews: some View {
        Ring()
    }
}
