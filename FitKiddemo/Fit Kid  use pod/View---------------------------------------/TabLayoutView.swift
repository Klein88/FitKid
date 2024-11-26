//
//  TabLayoutView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/9.
//

import SwiftUI
import AxisTabView
import SlideOverCard

struct TabLayoutView: View {
    let texts : [String] = ["主页","运动","饮食","我的"]
    @EnvironmentObject var choose3Dmodel : Choose3DModelData
    @State var selection : Int = 0
    @State var ispresend : Bool = false
    var body: some View {
        ZStack{
            Color(CGColor(red: 253 / 255, green: 253 / 255, blue: 150 / 255, alpha: 0.5))
                .ignoresSafeArea()
            VStack{
                TabView(selection: $selection) {
                                    HomeView()
                                        .tabItem {
                                            Image(systemName: "house")
                                            Text("主页")
                                        }
                                        .tag(0)
                                    AllSportView()
                                        .tabItem {
                                            Image(systemName: "figure.run")
                                            Text("运动")
                                        }
                                        .tag(1)
                                    FoodView()
                                        .tabItem {
                                            Image(systemName: "carrot")
                                            Text("饮食")
                                        }
                                        .tag(2)
                                    MineView()
                                        .tabItem {
                                            Image(systemName: "person.circle")
                                            Text("我的")
                                        }
                                        .tag(3)
                                }
            }
            
            if choose3Dmodel.issport == true && choose3Dmodel.sportname == "开合跳"
            {
                FitKidQuickPoseView()
                    .overlay(alignment: .bottom)
                {
                    Button(action: {
                        self.ispresend = true
                    }, label: {
                        Text("3D机器人跟随训练")
                            .fontWeight(.heavy)
                            .font(.system(size:20))
                            .foregroundColor(.white)
                            .frame(width:200 ,height: 40)
                            .background(Color.green)
                            .cornerRadius(20)
                    })
                }
                    .fullScreenCover(isPresented: $ispresend , content: {
                        ARRobotView(isshow: $ispresend , time: 67)
                    })
            }
            
            if choose3Dmodel.issport == true && choose3Dmodel.sportname == "仰卧起坐"
            {
                FitKidQuickPoseView_Situps()
                    .overlay(alignment: .bottom)
                {
                    Button(action: {
                        self.ispresend = true
                    }, label: {
                        Text("3D机器人跟随训练")
                            .fontWeight(.heavy)
                            .font(.system(size:20))
                            .foregroundColor(.white)
                            .frame(width:200 ,height: 40)
                            .background(Color.green)
                            .cornerRadius(20)
                    })
                }
                    .fullScreenCover(isPresented: $ispresend , content: {
                        ARRobotView(isshow: $ispresend , time: 97)
                    })
            }
            
            
            
        }
        
    }
}

struct TabLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        TabLayoutView()
            .environmentObject(Choose3DModelData())
    }
}
