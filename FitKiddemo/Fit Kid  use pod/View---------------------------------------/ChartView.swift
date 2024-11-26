//
//  ChartView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/17.
//

import SwiftUI
import Charts
import SwiftUICharts
struct ChartView: View {
    @EnvironmentObject var caloriesfakedata : CaloriesFakeData
    @EnvironmentObject var choose3Dmodeldata : Choose3DModelData
    @State var chartstyle : String = "折线图"
    @State var name : String
    var body: some View {
        VStack
        {
            //BarChartView(data: ChartData(values: [(caloriesfakedata.data_day[0].sportname,caloriesfakedata.data_day[0].calories), (caloriesfakedata.data_day[1].sportname,caloriesfakedata.data_day[1].calories), (caloriesfakedata.data_day[2].sportname,caloriesfakedata.data_day[2].calories), (caloriesfakedata.data_day[3].sportname,caloriesfakedata.data_day[3].calories), (caloriesfakedata.data_day[4].sportname,caloriesfakedata.data_day[4].calories)]), title: "消耗卡路里", legend: "/天" , form: ChartForm.extraLarge)
            if self.name == "年"
            {
                if self.chartstyle == "折线图"
                {
                    LineView(data: [Double(caloriesfakedata.data_year[0].calories) ,Double(caloriesfakedata.data_year[1].calories),Double(caloriesfakedata.data_year[2].calories),Double(caloriesfakedata.data_year[3].calories),Double(caloriesfakedata.data_year[4].calories),Double(caloriesfakedata.data_year[5].calories)] , title: "卡路里消耗" ,legend: "/年" )
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .offset(y: 100)
                    
                }
                else if self.chartstyle == "条状图"
                {
                    BarChartView(data: ChartData(values: [(caloriesfakedata.data_year[0].time , Double(caloriesfakedata.data_year[0].calories)),(caloriesfakedata.data_year[1].time , Double(caloriesfakedata.data_year[1].calories)),(caloriesfakedata.data_year[2].time , Double(caloriesfakedata.data_year[2].calories)),(caloriesfakedata.data_year[3].time , Double(caloriesfakedata.data_year[3].calories)),(caloriesfakedata.data_year[4].time , Double(caloriesfakedata.data_year[4].calories)),(caloriesfakedata.data_year[5].time , Double(caloriesfakedata.data_year[5].calories))]), title: "卡路里消耗" ,legend: "/年"  )
                }
                else if self.chartstyle == "饼状图"
                {
                    PieChartView(data: [Double(caloriesfakedata.data_year[0].calories) ,Double(caloriesfakedata.data_year[1].calories),Double(caloriesfakedata.data_year[2].calories),Double(caloriesfakedata.data_year[3].calories),Double(caloriesfakedata.data_year[4].calories),Double(caloriesfakedata.data_year[5].calories)], title: "卡路里消耗" ,legend: "/年" )
                }
            }
            else if self.name == "月"
            {
                if self.chartstyle == "折线图"
                {
                    LineView(data: [Double(caloriesfakedata.data_month[0].calories) ,Double(caloriesfakedata.data_month[1].calories),Double(caloriesfakedata.data_month[2].calories),Double(caloriesfakedata.data_month[3].calories),Double(caloriesfakedata.data_month[4].calories),Double(caloriesfakedata.data_month[5].calories)] , title: "卡路里消耗" ,legend: "/月" )
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .offset(y: 100)
                    
                }
                else if self.chartstyle == "条状图"
                {
                    BarChartView(data: ChartData(values: [(caloriesfakedata.data_month[0].time , Double(caloriesfakedata.data_month[0].calories)),(caloriesfakedata.data_month[1].time , Double(caloriesfakedata.data_month[1].calories)),(caloriesfakedata.data_month[2].time , Double(caloriesfakedata.data_month[2].calories)),(caloriesfakedata.data_month[3].time , Double(caloriesfakedata.data_month[3].calories)),(caloriesfakedata.data_month[4].time , Double(caloriesfakedata.data_month[4].calories)),(caloriesfakedata.data_month[5].time , Double(caloriesfakedata.data_month[5].calories))]), title: "卡路里消耗" ,legend: "/月"  )
                }
                else if self.chartstyle == "饼状图"
                {
                    PieChartView(data: [Double(caloriesfakedata.data_month[0].calories) ,Double(caloriesfakedata.data_month[1].calories),Double(caloriesfakedata.data_month[2].calories),Double(caloriesfakedata.data_month[3].calories),Double(caloriesfakedata.data_month[4].calories),Double(caloriesfakedata.data_month[5].calories)], title: "卡路里消耗" ,legend: "/月" )
                }
            }
            else if self.name == "天"
            {
                if self.chartstyle == "折线图"
                {
                    LineView(data: [Double(caloriesfakedata.data_day[0].calories) ,Double(caloriesfakedata.data_day[1].calories),Double(caloriesfakedata.data_day[2].calories),Double(caloriesfakedata.data_day[3].calories),Double(caloriesfakedata.data_day[4].calories),Double(caloriesfakedata.data_day[5].calories)] , title: "卡路里消耗" ,legend: "/天" )
                        .frame(width: UIScreen.main.bounds.width - 20)
                        .offset(y: 100)
                    
                }
                else if self.chartstyle == "条状图"
                {
                    BarChartView(data: ChartData(values: [(caloriesfakedata.data_day[0].time , Double(caloriesfakedata.data_day[0].calories)),(caloriesfakedata.data_day[1].time , Double(caloriesfakedata.data_day[1].calories)),(caloriesfakedata.data_day[2].time , Double(caloriesfakedata.data_day[2].calories)),(caloriesfakedata.data_day[3].time , Double(caloriesfakedata.data_day[3].calories)),(caloriesfakedata.data_day[4].time , Double(caloriesfakedata.data_day[4].calories)),(caloriesfakedata.data_day[5].time , Double(caloriesfakedata.data_day[5].calories))]), title: "卡路里消耗" ,legend: "/天" )
                }
                else if self.chartstyle == "饼状图"
                {
                    PieChartView(data: [Double(caloriesfakedata.data_day[0].calories) ,Double(caloriesfakedata.data_day[1].calories),Double(caloriesfakedata.data_day[2].calories),Double(caloriesfakedata.data_day[3].calories),Double(caloriesfakedata.data_day[4].calories),Double(caloriesfakedata.data_day[5].calories)], title: "卡路里消耗" ,legend: "/天" )
                }
            }
            
        }
        .frame(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.height - 10)
        .overlay(alignment: .topLeading){
            Menu
            {
                Button(action: {
                    self.chartstyle = "折线图"
                }, label: {
                    Text("折线图")
                })
                Button(action: {
                    self.chartstyle = "饼状图"
                }, label: {
                    Text("饼状图")
                })
                Button(action: {
                    self.chartstyle = "条状图"
                }, label: {
                    Text("条状图")
                })
                
                
            }label: {
                Text("图形样式")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                    .frame(width: UIScreen.main.bounds.width * 3 / 8 , height: 50)
                    .background(LinearGradient(colors: [Color(CGColor(red: 44 / 255, green: 142 / 255, blue: 239 / 255, alpha: 1.0)) , Color(CGColor(red: 60 / 255, green: 208 / 255, blue: 254 / 255, alpha: 1.0)) , Color(CGColor(red: 255 / 255, green: 147 / 255, blue: 100 / 255, alpha: 1.0))], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
            }
        }
        .overlay(alignment: .topTrailing)
        {
            Button(action: {
                choose3Dmodeldata.isshowChartView = false
            }, label: {
                Text("取消")
                    .fontWeight(.heavy)
                    .font(.system(size:20))
                    .foregroundColor(.white)
                    .frame(width:100 ,height: 30)
                    .background(LinearGradient(colors: [Color(CGColor(red: 221 / 255, green: 34 / 255, blue: 221 / 255, alpha: 1.0)),Color(CGColor(red: 17 / 255, green: 238 / 255, blue: 194 / 255, alpha: 1.0))], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20)
            })
        }
    }
}

