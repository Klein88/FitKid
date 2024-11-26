//
//  CaloriesFakeModel.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/17.
//

import Foundation



struct CaloriesFakeDay : Hashable
{
    var sportname : String
    var calories : Int
    var time : String
}

struct CaloriesFakeMonth : Hashable
{
    var calories : Int
    var time : String
}

struct CaloriesFakeYear : Hashable
{
    
    var calories : Int
    var time : String
}

struct CaloriesFakeRow : Hashable
{
    var calories : Int
    var jumptime : String
    var sportname : String
}

struct SportTimeFakeDataType : Hashable
{
    var sporttime : Int
    var yundongshijian  : String
}
