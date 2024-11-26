//
//  ChartDetailView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/22.
//

import SwiftUI
import SwiftUICharts
struct ChartDetailView: View {
    @EnvironmentObject var caloriesfakedata : CaloriesFakeData
    @State var nian_yue_ri : String = "天"
    @State var yangshi  : Int = 1
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            VStack {
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.blue)
                    })
                    .offset(x:10)
                    Spacer()
                }
            }
    
            VStack {
                HStack{
                    VStack
                    {
                        if self.nian_yue_ri == "天"
                        {
                            Text("运动总时间")
                                .foregroundColor(.gray)
                                .font(.system(size : 10))
                            Text("4.2小时")
                                .font(.system(size : 25))
                                .fontWeight(.heavy)
                            Text("相比昨日 ↓ 1.2")
                                .foregroundColor(.red)
                                .font(.system(size : 10))
                                .fontWeight(.heavy)
                        }
                        if self.nian_yue_ri == "月"
                        {
                            Text("运动总时间")
                                .foregroundColor(.gray)
                                .font(.system(size : 10))
                            Text("132.6小时")
                                .font(.system(size : 25))
                                .fontWeight(.heavy)
                            Text("相比上月 ↑ 12.4")
                                .foregroundColor(.green)
                                .font(.system(size : 10))
                                .fontWeight(.heavy)
                        }
                        if self.nian_yue_ri == "年"
                        {
                            Text("运动总时间")
                                .foregroundColor(.gray)
                                .font(.system(size : 10))
                            Text("1432.0小时")
                                .font(.system(size : 25))
                                .fontWeight(.heavy)
                            Text("相比去年 ↑ 200.4")
                                .foregroundColor(.green)
                                .font(.system(size : 10))
                                .fontWeight(.heavy)
                        }
                    }
                    .frame(width: 130 , height: 80)
                    
                    VStack
                    {
                        if self.nian_yue_ri == "天"
                        {
                            Text("卡路里总消耗")
                                .foregroundColor(.gray)
                                .font(.system(size : 10))
                            Text("1003卡路里")
                                .font(.system(size : 25))
                                .fontWeight(.heavy)
                            Text("相比昨日 ↓ 215")
                                .foregroundColor(.red)
                                .font(.system(size : 10))
                                .fontWeight(.heavy)
                            
                        }
                        if self.nian_yue_ri == "月"
                        {
                            Text("卡路里总消耗")
                                .foregroundColor(.gray)
                                .font(.system(size : 10))
                            Text("34156卡路里")
                                .font(.system(size : 25))
                                .fontWeight(.heavy)
                            Text("相比上月 ↑ 4002")
                                .foregroundColor(.green)
                                .font(.system(size : 10))
                                .fontWeight(.heavy)
                        }
                        if self.nian_yue_ri == "年"
                        {
                            Text("卡路里总消耗")
                                .foregroundColor(.gray)
                                .font(.system(size : 10))
                            Text("334766卡路里")
                                .font(.system(size : 25))
                                .fontWeight(.heavy)
                            Text("相比去年 ↑ 50067")
                                .foregroundColor(.green)
                                .font(.system(size : 10))
                                .fontWeight(.heavy)
                        }
                    }
                    .frame(width: 200 , height: 80)
                }
                HStack{
                    Menu{
                        Button(action: {
                            self.yangshi = 1
                        }, label: {
                            Text("折线图")
                        })
                        Button(action: {
                            self.yangshi = 2
                        }, label: {
                            Text("柱状图")
                        })
                        Button(action: {
                            self.yangshi = 3
                        }, label: {
                            Text("饼图")
                        })
                    }label: {
                        Text("样式选择 >")
                            .frame(width: 100 , height: 50)
                            .font(.system(size : 20))
                            .fontWeight(.heavy)
                            .background(Color("danbaizhi"))
                            .cornerRadius(20)
                            .foregroundColor(.white)
                    }
                    .offset(x: 20)
                    Spacer()
                    Menu {
                        Button(action: {
                            self.nian_yue_ri = "天"
                        }, label: {
                            Text("每天")
                        })
                        Button(action: {
                            self.nian_yue_ri = "月"
                        }, label: {
                            Text("每月")
                        })
                        Button(action: {
                            self.nian_yue_ri = "年"
                        }, label: {
                            Text("每年")
                        })
                    }label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .offset(x: -15)
                    }
                    Text("\(nian_yue_ri)")
                        .font(.system(size: 30))
                        .fontWeight(.heavy)
                        .offset(x: -20)
                }
                HStack
                {
                    
                    if self.nian_yue_ri == "年"
                    {
                        if self.yangshi == 1
                        {
                            LineChartView(data: [Double(caloriesfakedata.SportTimeData_Year[0].sporttime),Double(caloriesfakedata.SportTimeData_Year[1].sporttime),Double(caloriesfakedata.SportTimeData_Year[2].sporttime),Double(caloriesfakedata.SportTimeData_Year[3].sporttime),Double(caloriesfakedata.SportTimeData_Year[4].sporttime),Double(caloriesfakedata.SportTimeData_Year[5].sporttime)], title: "运动时间",legend: "/年")
                            LineChartView(data: [Double(caloriesfakedata.data_year[0].calories) ,Double(caloriesfakedata.data_year[1].calories),Double(caloriesfakedata.data_year[2].calories),Double(caloriesfakedata.data_year[3].calories),Double(caloriesfakedata.data_year[4].calories),Double(caloriesfakedata.data_year[5].calories)] , title: "卡路里消耗" ,legend: "/年" )
                        }
                        
                        if self.yangshi == 2
                        {
                            BarChartView(data: ChartData(values: [(caloriesfakedata.SportTimeData_Year[0].yundongshijian , caloriesfakedata.SportTimeData_Year[0].sporttime),(caloriesfakedata.SportTimeData_Year[1].yundongshijian , caloriesfakedata.SportTimeData_Year[1].sporttime),(caloriesfakedata.SportTimeData_Year[2].yundongshijian , caloriesfakedata.SportTimeData_Year[2].sporttime),(caloriesfakedata.SportTimeData_Year[3].yundongshijian , caloriesfakedata.SportTimeData_Year[3].sporttime),(caloriesfakedata.SportTimeData_Year[4].yundongshijian , caloriesfakedata.SportTimeData_Year[4].sporttime),(caloriesfakedata.SportTimeData_Year[5].yundongshijian , caloriesfakedata.SportTimeData_Year[5].sporttime)]), title: "运动时间",legend: "/年")
                            
                            BarChartView(data: ChartData(values: [(caloriesfakedata.data_year[0].time , Double(caloriesfakedata.data_year[0].calories)),(caloriesfakedata.data_year[1].time , Double(caloriesfakedata.data_year[1].calories)),(caloriesfakedata.data_year[2].time , Double(caloriesfakedata.data_year[2].calories)),(caloriesfakedata.data_year[3].time , Double(caloriesfakedata.data_year[3].calories)),(caloriesfakedata.data_year[4].time , Double(caloriesfakedata.data_year[4].calories)),(caloriesfakedata.data_year[5].time , Double(caloriesfakedata.data_year[5].calories))]), title: "卡路里消耗" ,legend: "/年"  )
                        }
                        
                        if self.yangshi == 3
                        {
                            PieChartView(data: [Double(caloriesfakedata.SportTimeData_Year[0].sporttime),Double(caloriesfakedata.SportTimeData_Year[1].sporttime),Double(caloriesfakedata.SportTimeData_Year[2].sporttime),Double(caloriesfakedata.SportTimeData_Year[3].sporttime),Double(caloriesfakedata.SportTimeData_Year[4].sporttime),Double(caloriesfakedata.SportTimeData_Year[5].sporttime)], title: "运动时间" ,legend: "/年")
                            
                            PieChartView(data: [Double(caloriesfakedata.data_year[0].calories) ,Double(caloriesfakedata.data_year[1].calories),Double(caloriesfakedata.data_year[2].calories),Double(caloriesfakedata.data_year[3].calories),Double(caloriesfakedata.data_year[4].calories),Double(caloriesfakedata.data_year[5].calories)], title: "卡路里消耗" ,legend: "/年" )
                            
                            
                        }
                    }
                    
                    if self.nian_yue_ri == "月"
                    {
                        if self.yangshi == 1
                        {
                            LineChartView(data: [Double(caloriesfakedata.SportTimeData_Month[0].sporttime),Double(caloriesfakedata.SportTimeData_Month[1].sporttime),Double(caloriesfakedata.SportTimeData_Month[2].sporttime),Double(caloriesfakedata.SportTimeData_Month[3].sporttime),Double(caloriesfakedata.SportTimeData_Month[4].sporttime),Double(caloriesfakedata.SportTimeData_Month[5].sporttime)], title: "运动时间",legend: "/月")
                            LineChartView(data: [Double(caloriesfakedata.data_month[0].calories) ,Double(caloriesfakedata.data_month[1].calories),Double(caloriesfakedata.data_month[2].calories),Double(caloriesfakedata.data_month[3].calories),Double(caloriesfakedata.data_month[4].calories),Double(caloriesfakedata.data_month[5].calories)] , title: "卡路里消耗" ,legend: "/年" )
                        }
                        
                        if self.yangshi == 2
                        {
                            BarChartView(data: ChartData(values: [(caloriesfakedata.SportTimeData_Month[0].yundongshijian , caloriesfakedata.SportTimeData_Month[0].sporttime),(caloriesfakedata.SportTimeData_Month[1].yundongshijian , caloriesfakedata.SportTimeData_Month[1].sporttime),(caloriesfakedata.SportTimeData_Month[2].yundongshijian , caloriesfakedata.SportTimeData_Month[2].sporttime),(caloriesfakedata.SportTimeData_Month[3].yundongshijian , caloriesfakedata.SportTimeData_Month[3].sporttime),(caloriesfakedata.SportTimeData_Month[4].yundongshijian , caloriesfakedata.SportTimeData_Month[4].sporttime),(caloriesfakedata.SportTimeData_Month[5].yundongshijian , caloriesfakedata.SportTimeData_Month[5].sporttime)]), title: "运动时间",legend: "/月")
                            
                            BarChartView(data: ChartData(values: [(caloriesfakedata.data_month[0].time , Double(caloriesfakedata.data_month[0].calories)),(caloriesfakedata.data_month[1].time , Double(caloriesfakedata.data_month[1].calories)),(caloriesfakedata.data_month[2].time , Double(caloriesfakedata.data_month[2].calories)),(caloriesfakedata.data_month[3].time , Double(caloriesfakedata.data_month[3].calories)),(caloriesfakedata.data_month[4].time , Double(caloriesfakedata.data_month[4].calories)),(caloriesfakedata.data_month[5].time , Double(caloriesfakedata.data_month[5].calories))]), title: "卡路里消耗" ,legend: "/月"  )
                        }
                        
                        if self.yangshi == 3
                        {
                            PieChartView(data: [Double(caloriesfakedata.SportTimeData_Month[0].sporttime),Double(caloriesfakedata.SportTimeData_Month[1].sporttime),Double(caloriesfakedata.SportTimeData_Month[2].sporttime),Double(caloriesfakedata.SportTimeData_Month[3].sporttime),Double(caloriesfakedata.SportTimeData_Month[4].sporttime),Double(caloriesfakedata.SportTimeData_Month[5].sporttime)], title: "运动时间" ,legend: "/月")
                            
                            PieChartView(data: [Double(caloriesfakedata.data_month[0].calories) ,Double(caloriesfakedata.data_month[1].calories),Double(caloriesfakedata.data_month[2].calories),Double(caloriesfakedata.data_month[3].calories),Double(caloriesfakedata.data_month[4].calories),Double(caloriesfakedata.data_month[5].calories)], title: "卡路里消耗" ,legend: "/月" )
                        }
                    }
                    
                    
                    if self.nian_yue_ri == "天"
                    {
                        if self.yangshi == 1
                        {
                            LineChartView(data: [Double(caloriesfakedata.SportTimeData_Day[0].sporttime),Double(caloriesfakedata.SportTimeData_Day[1].sporttime),Double(caloriesfakedata.SportTimeData_Day[2].sporttime),Double(caloriesfakedata.SportTimeData_Day[3].sporttime),Double(caloriesfakedata.SportTimeData_Day[4].sporttime),Double(caloriesfakedata.SportTimeData_Day[5].sporttime)], title: "运动时间",legend: "/天")
                            LineChartView(data: [Double(caloriesfakedata.data_day[0].calories) ,Double(caloriesfakedata.data_day[1].calories),Double(caloriesfakedata.data_day[2].calories),Double(caloriesfakedata.data_day[3].calories),Double(caloriesfakedata.data_day[4].calories),Double(caloriesfakedata.data_day[5].calories)] , title: "卡路里消耗" ,legend: "/天" )
                        }
                        
                        if self.yangshi == 2
                        {
                            BarChartView(data: ChartData(values: [(caloriesfakedata.SportTimeData_Day[0].yundongshijian , caloriesfakedata.SportTimeData_Day[0].sporttime),(caloriesfakedata.SportTimeData_Day[1].yundongshijian , caloriesfakedata.SportTimeData_Day[1].sporttime),(caloriesfakedata.SportTimeData_Day[2].yundongshijian , caloriesfakedata.SportTimeData_Day[2].sporttime),(caloriesfakedata.SportTimeData_Day[3].yundongshijian , caloriesfakedata.SportTimeData_Day[3].sporttime),(caloriesfakedata.SportTimeData_Day[4].yundongshijian , caloriesfakedata.SportTimeData_Day[4].sporttime),(caloriesfakedata.SportTimeData_Day[5].yundongshijian , caloriesfakedata.SportTimeData_Day[5].sporttime)]), title: "运动时间",legend: "/天")
                            
                            BarChartView(data: ChartData(values: [(caloriesfakedata.data_day[0].time , Double(caloriesfakedata.data_day[0].calories)),(caloriesfakedata.data_day[1].time , Double(caloriesfakedata.data_day[1].calories)),(caloriesfakedata.data_day[2].time , Double(caloriesfakedata.data_day[2].calories)),(caloriesfakedata.data_day[3].time , Double(caloriesfakedata.data_day[3].calories)),(caloriesfakedata.data_day[4].time , Double(caloriesfakedata.data_day[4].calories)),(caloriesfakedata.data_day[5].time , Double(caloriesfakedata.data_day[5].calories))]), title: "卡路里消耗" ,legend: "/天"  )
                        }
                        
                        if self.yangshi == 3
                        {
                            PieChartView(data: [Double(caloriesfakedata.SportTimeData_Day[0].sporttime),Double(caloriesfakedata.SportTimeData_Day[1].sporttime),Double(caloriesfakedata.SportTimeData_Day[2].sporttime),Double(caloriesfakedata.SportTimeData_Day[3].sporttime),Double(caloriesfakedata.SportTimeData_Day[4].sporttime),Double(caloriesfakedata.SportTimeData_Day[5].sporttime)], title: "运动时间" ,legend: "/天")
                            
                            PieChartView(data: [Double(caloriesfakedata.data_day[0].calories) ,Double(caloriesfakedata.data_day[1].calories),Double(caloriesfakedata.data_day[2].calories),Double(caloriesfakedata.data_day[3].calories),Double(caloriesfakedata.data_day[4].calories),Double(caloriesfakedata.data_day[5].calories)], title: "卡路里消耗" ,legend: "/天" )
                        }
                    }
                }
                Group{
                    HStack{
                        Text(" ")
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        Text("将数据同步到Apple健康")
                            .fontWeight(.heavy)

                        Spacer()
                    }
                    .offset(x:20,y:10)
                    Text("   ")
                    Text("   ")
                    HStack
                    {
                        Text("运动建议")
                            .font(.system(size : 20))
                            .fontWeight(.heavy)
                        Spacer()
                    }
                    .padding()
                    .offset(x:20,y:-30)
                    if self.nian_yue_ri == "天"
                    {
                        Text("今日表现良好，明天再接再厉哟！")
                            .foregroundColor(.gray)
                            .offset(y: -20)
                    }
                    if self.nian_yue_ri == "月"
                    {
                        Text("这个月没有太多的运动哦，请下个月继续努力！")
                            .foregroundColor(.gray)
                            .offset(y: -20)
                    }
                    if self.nian_yue_ri == "年"
                    {
                        Text("今年的表现良好，来年请继续努力，更上一层楼哟！")
                            .foregroundColor(.gray)
                            .offset(y: -20)
                    }
                    
                    HStack{
                        Text("更多操作")
                            .font(.system(size : 20))
                            .fontWeight(.heavy)
                        Spacer()
                    }
                    .padding()
                    .offset(x:20,y: -20)
                    HStack{
                        Image("weixin")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 40 , height: 40)
                        Text("分享至微信")
                        Spacer()
                    }
                    .offset(x:30,y: -20)
                    HStack
                    {
                        Image("weibo")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 40 , height: 40)
                        Text("分享至微博")
                        Spacer()
                    }
                    .offset(x:30,y: -20)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
