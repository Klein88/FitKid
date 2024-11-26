//
//  MealSchedule.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/18.
//

import SwiftUI

struct MealSchedule: View {
    // 创建一个数组来保存日期
    var dates: [String] = Array(1...31).map { "6 月 \($0) 日" }
    // 创建一个State来保存当前选中的日期
    @State private var selectedDate: String? = "6 月 2 日"
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // 创建一个横向滚动的日期选择器
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(dates, id: \.self) { date in
                                Button(action: {
                                    self.selectedDate = date
                                }) {
                                    Text(date)
                                        .fontWeight(self.selectedDate == date ? .bold : .regular)
                                        .padding()
                                        .background(self.selectedDate == date ? Color.blue : Color.clear)
                                        .foregroundColor(self.selectedDate == date ? .white : .black)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    // 在这里添加你的餐食安排的内容
                    VStack {
                        HStack {
                            Text("早餐")
                                .font(.title3)
                                .offset(x: 30)
                            Spacer()
                            Text("230 kcal")
                                .offset(x: -30)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Image("honeypancake")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .offset(x:30)
                            VStack {
                                Text("草莓小蛋糕")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("早上 7:00")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            .offset(x:35)
                            Spacer()
                            Image(systemName: "greaterthan.circle")
                                .foregroundColor(.gray)
                                .offset(x: -40)
                        }
                        HStack {
                            Image("coffee")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .offset(x:30)
                            VStack {
                                Text("巧克力牛奶")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("早上 7:30")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            .offset(x:35)
                            Spacer()
                            Image(systemName: "greaterthan.circle")
                                .foregroundColor(.gray)
                                .offset(x: -40)
                        }
                    }
                    Divider()
                    VStack {
                        HStack {
                            Text("午餐")
                                .font(.title3)
                                .offset(x: 30)
                            Spacer()
                            Text("500 kcal")
                                .offset(x: -30)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Image("steak")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .offset(x:30)
                            VStack {
                                Text("儿童牛排")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("下午 1:00")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            .offset(x:35)
                            Spacer()
                            Image(systemName: "greaterthan.circle")
                                .foregroundColor(.gray)
                                .offset(x: -40)
                        }
                        HStack {
                            Image("milk")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .offset(x:30)
                            VStack {
                                Text("纯牛奶")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("下午 1:20")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            .offset(x:35)
                            Spacer()
                            Image(systemName: "greaterthan.circle")
                                .foregroundColor(.gray)
                                .offset(x: -40)
                        }
                    }
                    Divider()
                    VStack {
                        HStack {
                            Text("小吃")
                                .font(.title3)
                                .offset(x: 30)
                            Spacer()
                            Text("140 kcal")
                                .offset(x: -30)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Image("orange")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .offset(x:30)
                            VStack {
                                Text("橙子")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("下午 4:30")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            .offset(x:35)
                            Spacer()
                            Image(systemName: "greaterthan.circle")
                                .foregroundColor(.gray)
                                .offset(x: -40)
                        }
                        HStack {
                            Image("pie")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .offset(x:30)
                            VStack {
                                Text("苹果派")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("下午 4:40")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            .offset(x:35)
                            Spacer()
                            Image(systemName: "greaterthan.circle")
                                .foregroundColor(.gray)
                                .offset(x: -40)
                        }
                    }
                    Divider()
                    VStack {
                        HStack {
                            Text("晚餐")
                                .font(.title3)
                                .offset(x: 30)
                            Spacer()
                            Text("320 kcal")
                                .offset(x: -30)
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Image("salad")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .offset(x:30)
                            VStack {
                                Text("沙拉")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("下午 7:00")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            .offset(x:35)
                            Spacer()
                            Image(systemName: "greaterthan.circle")
                                .foregroundColor(.gray)
                                .offset(x: -40)
                        }
                        HStack {
                            Image("soup")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .offset(x:30)
                            VStack {
                                Text("鸡汤")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text("下午 7:30")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            .offset(x:35)
                            Spacer()
                            Image(systemName: "greaterthan.circle")
                                .foregroundColor(.gray)
                                .offset(x: -40)
                        }
                    }
                    Spacer()
                }
                .navigationBarTitle("饮食日记", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                })
            }
        }
    }
}

struct MealSchedule_Previews: PreviewProvider {
    static var previews: some View {
        MealSchedule()
    }
}
