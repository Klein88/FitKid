//
//  SceneModelItemView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/10.
//

import SwiftUI
import SceneKit
struct SceneModelItemView: View {
    @State var modelname : String
    @Binding var ischoose : Bool
    @EnvironmentObject var Choose3DModel : Choose3DModelData
    var body: some View {
        VStack
        {
            Button(action: {
                Choose3DModel.tDModelNameToChoose = modelname + ".usdz"
                self.ischoose = false
            }, label: {
                Image(modelname)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            })
            .frame(width: UIScreen.main.bounds.width / 2 - 20, height: UIScreen.main.bounds.height / 4)
            .cornerRadius(20)
            .shadow(radius: 40 , x: 5 , y: 5)
            
        }
    }
}
