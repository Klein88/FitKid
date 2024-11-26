//
//  AdministratorsTest2View.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/11.
//

import SwiftUI
import SceneKit
import ARKit
import RealityKit
import CardCarousel
import SwiftUICharts



struct AdministratorsTest2View: View {
    //@State var selection : Bool = false
    var value: Double
        var index: Int = 0
        var width: Float
        var numberOfDataPoints: Int
        var cellWidth: Double {
            return Double(width)/(Double(numberOfDataPoints) * 1.5)
        }
        var accentColor: Color
        var gradient: GradientColor?
        
        @State var scaleValue: Double = 0
        @Binding var touchLocation: CGFloat
        public var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(LinearGradient(gradient: gradient?.getGradient() ?? GradientColor(start: accentColor, end: accentColor).getGradient(), startPoint: .bottom, endPoint: .top))
                }
                .frame(width: CGFloat(self.cellWidth))
                .scaleEffect(CGSize(width: 1, height: self.scaleValue), anchor: .bottom)
                .onAppear(){
                    self.scaleValue = self.value
                }
            .animation(Animation.spring().delay(self.touchLocation < 0 ?  Double(self.index) * 0.04 : 0))
        }
}
//
struct AdministratorsTest2View_Previews: PreviewProvider {
    static var previews: some View {
        AdministratorsTest2View(value: Double(0.75), width: 320, numberOfDataPoints: 12, accentColor: Colors.OrangeStart, gradient: nil, touchLocation: .constant(-1))
            .environmentObject(Choose3DModelData())
    }
}


//struct ArtestView : UIViewRepresentable
//{
//    func makeUIView(context: Context) -> ARView {
//        let artestview = ARView(frame: .zero)
//        let config = ARBodyTrackingConfiguration()
//        config.planeDetection = .vertical
//        config.worldAlignment = .gravity
//        artestview.session.run(config , options: [])
//        artestview.session.delegate = artestview
//        artestview.loadRobot()
//
//        return artestview
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {
//
//    }
//
//    typealias UIViewType = ARView
//
//}