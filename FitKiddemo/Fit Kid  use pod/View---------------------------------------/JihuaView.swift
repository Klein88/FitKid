//
//  JihuaView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/25.
//

import SwiftUI

struct JihuaView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var caloriesFakeData : CaloriesFakeData
    @State var jihua : String = ""
    @State var biaoqian : [String] = []
    @State var starttime : Date = Date()
    @State var endtime : Date = Date()
    @State var beizhu : String = ""
    var body: some View {
        ZStack {
        Image("renwutask")
                .zIndex(0)
                .frame(width: 200, height: 200)
                .scaledToFit()
        VStack
            {
                HStack
                {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.gray)
                    })
                    .offset(x: 20)
                    
                    
                    Spacer()
                }
                VStack {
                    HStack{
                        Text("创建一个计划")
                            .font(.title)
                            .fontWeight(.bold)
                    Spacer()
                        
                    }
                    
                    Divider()
                    Image("mk")
                        .resizable()
                        .frame(width: 410, height: 250)
                    VStack
                    {
                        HStack {
                            Text("制定计划")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        TextField("制定计划", text: $jihua)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("textfieldcolor"), lineWidth: 1)
                            )
                        
                    }
                    .padding()
                    .offset(y:-20)
                    
                    HStack
                    {
                        Text("开始时间")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        DatePicker(
                            "",
                            selection: $starttime,
                            displayedComponents: [.hourAndMinute]
                        )
                        Text("结束时间")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        DatePicker(
                            "",
                            selection: $endtime,
                            displayedComponents: [.hourAndMinute]
                        )

                    }
                    .padding()
                    .offset(y:-20)
                    VStack
                    {
                        HStack{
                            Text("备注事项：")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .offset(x: 15)
                            Button(action: {
                                if self.beizhu != ""
                                {
                                    self.biaoqian.append(beizhu)
                                }
                            }, label: {
                                Text("添加备注")
                                .fontWeight(.bold)
                                    .foregroundColor(.blue)
  
                            })
                            Spacer()
                        }
                        HStack {
                            ForEach(biaoqian ,id: \.self)
                            {
                                it in
                                Text("\(it)")
                            }
                            
                            TextField("添加备注", text: $beizhu)
                                .foregroundColor(.black)
                                .offset(x: 20)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("textfieldcolor"), lineWidth: 1)
                                )
                            
                        }
                        
                    }
                    .offset(y:-20)
                }
                .padding()
                Spacer()
                Button(action: {
                    self.caloriesFakeData.jihuaFakeData.append(jihuaType(jihua: self.jihua, starttime: self.starttime, endtime: self.endtime, biaoqian: self.biaoqian))
                    
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("添加计划")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        
                })
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(Color(
                    "pick"))
                .clipShape(Capsule())
                .frame(width: 200, height: 50)
                .offset(y: -50)
            }
        }
    }
}
