//
//  ARRobotView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/17.
//

import SwiftUI
import UIKit
import RealityKit
import ARKit
struct ARRobotView: View {
    @Binding var isshow : Bool
    @State var time : Int
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
       VStack
        {
            ARRobotUIViewToSwiftUI()
        }
        .overlay(alignment : .topLeading){
            Button(action: {
                isshow = false
            }, label: {
                Image(systemName: "x.circle")
                    .foregroundColor(.blue)
            })
            
        }
        .onReceive(timer){
            _ in
            time -= 1
        }
        .overlay(alignment: .topTrailing)
        {
            Text("还剩\(time)秒")
                .frame(height: 40)
                .cornerRadius(10)
                .background(.blue)
                .foregroundColor(.white)
                .padding(.trailing , 10)
        }
        .overlay(alignment: .center)
        {
            if self.time == 0
            {
                Text("运动结束")
                    .frame(width: UIScreen.main.bounds.width - 80  , height: 40)
                    .background(.white)
                    .foregroundColor(.blue)
                    .cornerRadius(20)
                    .onAppear{
                        self.stoptime()
                    }
            }
        }
        
    }
}



struct ARRobotUIViewToSwiftUI : UIViewRepresentable
{
    func makeUIView(context: Context) -> ARView {
        let arview = ARView()
        let config = ARBodyTrackingConfiguration()
        config.frameSemantics = .bodyDetection
        arview.session.delegate = arview
        arview.session.run(config)
        arview.loadRobot()
        return arview
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
    typealias UIViewType = ARView
}
