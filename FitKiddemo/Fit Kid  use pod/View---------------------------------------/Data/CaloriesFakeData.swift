//
//  CaloriesFakeData.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/17.
//

import Foundation



class CaloriesFakeData : ObservableObject
{
    @Published var data_day : [CaloriesFakeDay] = [CaloriesFakeDay(sportname: "开合跳", calories: 103, time: "1号"),CaloriesFakeDay(sportname: "仰卧起坐", calories: 154, time: "2号"),CaloriesFakeDay(sportname: "开合跳", calories: 103, time: "3号"),CaloriesFakeDay(sportname: "跑步", calories: 154, time: "4号"),CaloriesFakeDay(sportname: "跑步", calories: 117, time: "5号"),CaloriesFakeDay(sportname: "仰卧起坐", calories: 91, time: "6号"),CaloriesFakeDay(sportname: "开合跳", calories: 123, time: "7号")]
    
    
    @Published var data_month : [CaloriesFakeMonth] = [CaloriesFakeMonth(calories: 5905, time: "1月"),CaloriesFakeMonth(calories: 3604, time: "2月"),CaloriesFakeMonth(calories: 3436, time: "3月"),CaloriesFakeMonth(calories: 4330, time: "4月"),CaloriesFakeMonth(calories: 3836, time: "5月"),CaloriesFakeMonth(calories: 4223, time: "6月"),CaloriesFakeMonth(calories: 4223, time: "7月"),CaloriesFakeMonth(calories: 3932, time: "8月"),CaloriesFakeMonth(calories: 4798, time: "9月"),CaloriesFakeMonth(calories: 4941, time: "10月"),CaloriesFakeMonth(calories: 4399, time: "11月"),CaloriesFakeMonth(calories: 5907, time: "12月")]
    
    
    @Published var data_year : [CaloriesFakeYear] = [CaloriesFakeYear(calories: 28863, time: "2018年"),CaloriesFakeYear(calories: 14759, time: "2019年"),CaloriesFakeYear(calories: 15581, time: "2020年"),CaloriesFakeYear(calories: 22460, time: "2021年"),CaloriesFakeYear(calories: 22969, time: "2022年"),CaloriesFakeYear(calories: 26393, time: "2023年")]
    
    @Published var data_row : [CaloriesFakeRow] = [CaloriesFakeRow(calories: 105, jumptime: "120秒", sportname: "开合跳"),CaloriesFakeRow(calories: 91, jumptime: "120秒", sportname: "仰卧起坐"),CaloriesFakeRow(calories: 120, jumptime: "107秒", sportname: "跑步"),CaloriesFakeRow(calories: 149, jumptime: "115秒", sportname: "跑步"),CaloriesFakeRow(calories: 94, jumptime: "120秒", sportname: "跳绳"),CaloriesFakeRow(calories: 167, jumptime: "113秒", sportname: "开合跳"),CaloriesFakeRow(calories: 155, jumptime: "120秒", sportname: "仰卧起坐"),CaloriesFakeRow(calories: 116, jumptime: "120秒", sportname: "仰卧起坐")]
    
    @Published var SportTimeData_Day : [SportTimeFakeDataType] = [SportTimeFakeDataType(sporttime: 107, yundongshijian: "9:51") , SportTimeFakeDataType(sporttime: 120, yundongshijian: "14:26") , SportTimeFakeDataType(sporttime: 240, yundongshijian: "15:03") , SportTimeFakeDataType(sporttime: 1800, yundongshijian: "19:01"),SportTimeFakeDataType(sporttime: 360, yundongshijian: "20:00"),SportTimeFakeDataType(sporttime: 240, yundongshijian: "20:04")]
        
        @Published var SportTimeData_Month : [SportTimeFakeDataType] = [SportTimeFakeDataType(sporttime: 31, yundongshijian: "1月") , SportTimeFakeDataType(sporttime: 40, yundongshijian: "2月") , SportTimeFakeDataType(sporttime: 24, yundongshijian: "3月") , SportTimeFakeDataType(sporttime: 29, yundongshijian: "4月"),SportTimeFakeDataType(sporttime: 29, yundongshijian: "5月"),SportTimeFakeDataType(sporttime: 45, yundongshijian: "6月"),SportTimeFakeDataType(sporttime: 43, yundongshijian: "7月"),SportTimeFakeDataType(sporttime: 10, yundongshijian: "8月"),SportTimeFakeDataType(sporttime: 23, yundongshijian: "9月"),SportTimeFakeDataType(sporttime: 26, yundongshijian: "10月"),SportTimeFakeDataType(sporttime: 30, yundongshijian: "11月"),SportTimeFakeDataType(sporttime: 29, yundongshijian: "12月")]
        
        
        @Published var SportTimeData_Year : [SportTimeFakeDataType] = [SportTimeFakeDataType(sporttime: 265, yundongshijian: "2018") , SportTimeFakeDataType(sporttime: 439, yundongshijian: "2019") , SportTimeFakeDataType(sporttime: 240, yundongshijian: "2020") , SportTimeFakeDataType(sporttime: 143, yundongshijian: "2021"),SportTimeFakeDataType(sporttime: 365, yundongshijian: "2022"),SportTimeFakeDataType(sporttime: 117, yundongshijian: "2023")]
    
    
    @Published var jihuaFakeData : [jihuaType] = [jihuaType(jihua: "一杯燕麦牛奶", starttime: Date(), endtime: Date(), biaoqian: ["饮食","居家"]) , jihuaType(jihua: "跑步60分钟", starttime: Date(), endtime: Date(), biaoqian: ["运动","户外"])]
}
