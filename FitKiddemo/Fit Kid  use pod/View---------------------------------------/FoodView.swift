//
//  FoodView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/3.
//

import SwiftUI
import ARKit
import CoreML

struct FoodView: View {
    @State private var isARCameraPresented = false
    @State private var foodRecords: [Food] = []
    //添加一个foodRecords的state来保存食物识别记录
    @State private var isCaptureSamplePresented = false
    @State private var isDetail = false
    @State private var isARFoodPlantPresented = false
    @StateObject private var model = CameraViewModel()
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                HStack {
                    Text("热量快照")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(x: 15)
                        .padding()
                    Spacer()
                    Button(action: {
                        isDetail = true
                    }) {
                        Image(systemName: "list.bullet")
                            .offset(x: -30)
                    }
                    .fullScreenCover(isPresented: $isDetail) {
                        MealSchedule()
                    }
                    
                }
                Image("pickfood")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .frame(width: 400, height: 200)
                Button(action: {
                    // 相机按钮点击事件
                    // 在这里添加相机按钮的功能实现
                    isARCameraPresented = true
                }) {
                    HStack {
                        Text("点击拍照")
                            .fontWeight(.bold)
                            .font(.title3)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.right.circle")
                            .font(Font.title.weight(.medium))
                            .foregroundColor(.white)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 24)
                    .background(Color(
                        "pick"))
                    .clipShape(Capsule())
                }
                .sheet(isPresented: $isARCameraPresented) {
                    ObjectScan(foodRecords: $foodRecords)     //这里可用sheet也可fullScreenCover
                    //foodRecords传递给ObjectScan
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {
                        // 食物摆盘按钮点击事件
                        // 在这里添加食物摆盘按钮的功能实现
                        isARFoodPlantPresented = true
                    }) {
                        Image("baipan")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                    }
                    .fullScreenCover(isPresented: $isARFoodPlantPresented) {
                        ARContentView()
                    }
                    .frame(height: 220)
                    
                    Button(action: {
                        isCaptureSamplePresented = true
                        // 3D建模
                    }) {
                        Image("saomiao")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                    }
                    .fullScreenCover(isPresented: $isCaptureSamplePresented) {
                        CaptureSampleView(model: model)
                    }
                    .frame(height: 220)
                    .offset(x: -20)
                }
            }

            VStack {
                Text("食物识别记录")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.vertical,10)
                    .offset(x: -110)
                ScrollView {
                        LazyVGrid(columns: gridLayout,spacing: 15, content: {
                            ForEach(foodRecords) {
                                //使用foodRecords显示食物记录
                                item in
                                FoodItemView(food: item)
                            }
                        })
                        .padding(15)
                }
            }
        }
    }
}
