//
//  AdministratorsTestView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/11.
//

import SwiftUI
import AxisTabView
import SceneKit
struct AdministratorsTestView: View {
    @State var selection : Int = 0
    var body: some View {
        AxisTabView(selection: $selection, constant: ATConstant(axisMode: .bottom)) { state in
            ATBeadStyle(state, color: .cyan, marbleColor: .orange)
        } content: {
            Text("11111")
                .tabItem(tag: 0, normal: {
                    Text("Tab 1")
                }, select: {
                    Text("Tab 1")
                        .bold()
                        .foregroundColor(Color.yellow)
                })
            Text("Tab 2")
                .tabItem(tag: 1, normal: {
                    Text("Tab 2")
                }, select: {
                    Text("Tab 2")
                        .bold()
                        .foregroundColor(Color.yellow)
                })
            
            ZStack{
                
                VStack
                {
                    Group{
                        SceneView(scene: SCNScene(named: "robot.usdz") , options: [.allowsCameraControl , .autoenablesDefaultLighting])
                            .frame(width: 150, height: 150)
                            
                    }
                    .frame(width: 150 , height: 150)
                    .cornerRadius(75)
                    MineViewOptionsView()
                    
                }
            }
            .tabItem(tag: 2, normal: {
                    VStack
                    {
                        Image(systemName: "star.fill")
                        Text("star")
                    }
                }, select: {
                    Text("star")
                        .bold()
                        .foregroundColor(Color.yellow)
                })
        } onTapReceive: { selectionTap in
            /// Imperative syntax
            print("---------------------")
            print("Selection : ", selectionTap)
            print("Already selected : ", self.selection == selectionTap)
        }
        .frame(height:  UIScreen.main.bounds.height)
    }
}

struct AdministratorsTestView_Previews: PreviewProvider {
    static var previews: some View {
        AdministratorsTestView()
    }
}
