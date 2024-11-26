//
//  TDShareView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/22.
//

import SwiftUI
import SceneKit
struct TDShareView: View {
    @EnvironmentObject var choose3Dmodeldata : Choose3DModelData
    @State var scalesize : Double = 1.0
    var body: some View {
        VStack
        {
            SceneView(scene: SCNScene(named: choose3Dmodeldata.tDModelNameToChoose) , options: [.allowsCameraControl , .autoenablesDefaultLighting])
                .scaleEffect(scalesize)
            
            Slider(value: $scalesize ,in: 0.1...1.0)
        }
    }
}
