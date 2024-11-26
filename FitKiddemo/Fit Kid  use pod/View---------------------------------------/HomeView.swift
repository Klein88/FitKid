//
//  ContentView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/3.
//

import SwiftUI
import SlideOverCard
struct HomeView: View {
    @EnvironmentObject var caloriesfakeData : CaloriesFakeData
    @State private var search=""
    @State private var isSearched = false
    @State private var istubiao = false
    @State private var ispaihangbang = false
    @State private var isjilu = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        VStack {
                            Text("小明，欢迎回来！")
                                .fontWeight(.bold)
                                .offset(x: -23)
                                .font(.title3)
                            Text("准备好今天的减肥计划了吗")
                                .foregroundColor(.gray)
                                .font(.headline)
                        }
                        .offset(x:60,y:15)
                        Spacer()
                        Image("touxiang1")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .offset(x:-40,y:15)
                    }.font(.title)
                    HStack {
                        ZStack {
                            Badge2().scaledToFit().frame(width: 70)
                            Badge1().scaledToFit().frame(width: 60)
                            Text("4").font(.title).fontWeight(.bold).foregroundColor(.white)
                        }.padding()
                        Text("今天还没有运动哦，请继续努力！").font(.headline).foregroundColor(.white)
                        ZStack {
                            Ring().padding()
                            Text("60%").font(.footnote).fontWeight(.heavy).foregroundColor(.white)
                        }
                    }.background(Color.brown).cornerRadius(12)
                        .frame(width: 400, height: 135)
       
                    
                    HStack {
                        VStack {
                            Button(action: {
                                isSearched = true
                            }) {
                                Image("jihua")
                                    .resizable()
                                    .frame(width: 235, height: 215)
                            }
                            .fullScreenCover(isPresented: $isSearched) {
                                JihuaView()
                            }
                            .offset(x: 20)
                            Button(action: {
                                ispaihangbang = true
                            }) {
                                Image("paihangbang")
                                    .resizable()
                                    .frame(width: 235, height: 175)
                                    .offset(y: -55)
                            }
                            .fullScreenCover(isPresented: $ispaihangbang) {
                                SportView_paiming()
                            }
                            .offset(x: 20)
                        }
                        .offset(x: 20)

                        VStack {
                            Button(action: {
                                istubiao = true
                            }) {
                                Image("tubiao1")
                                    .resizable()
                                    .frame(width: 255, height: 185)
                            }
                            .fullScreenCover(isPresented: $istubiao) {
                                ChartDetailView()
                            }
                            .offset(x:-25,y: -10)
                            Button(action: {
                                isjilu = true
                            }) {
                                Image("jilu1")
                                    .resizable()
                                    .frame(width: 235, height: 205)
                                    
                            }
                            .fullScreenCover(isPresented: $isjilu) {
                                AllRowCaloriesFakeDataView(isshowallrowcaloriesFakeDataView:.constant(true))
                            }
                            .offset(x:-20,y: -50)
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("今日计划")
                                .fontWeight(.bold)
                                .font(.title2)
                                .offset(x:60)
                            Spacer()
                            Text("查看更多")
                                .foregroundColor(.gray)
                                .offset(x: -60)
                        }
                        ForEach(0..<caloriesfakeData.jihuaFakeData.count , id: \.self)
                        {
                            it in
                            JiHuaRowView(chooseColor: it, starttime: caloriesfakeData.jihuaFakeData[it].starttime, endtime: caloriesfakeData.jihuaFakeData[it].endtime, shixiang: caloriesfakeData.jihuaFakeData[it].jihua, fujia: caloriesfakeData.jihuaFakeData[it].biaoqian)
                        }
                    }
                    .offset(y: -70)
                }
            }
        }
    }
}
