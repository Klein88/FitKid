//
//  AllRowCaloriesFakeDataView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/18.
//

import SwiftUI

struct AllRowCaloriesFakeDataView: View {
    @Binding var isshowallrowcaloriesFakeDataView : Bool
    @EnvironmentObject var caloriesfakedata : CaloriesFakeData
    @EnvironmentObject var choose3Dmodeldata : Choose3DModelData
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            List
            {
                ForEach(caloriesfakedata.data_row , id: \.self)
                {
                    it in
                    RowCaloriesFakeDataView(image: it.sportname+"-介绍", calories: it.calories, jumptime: it.jumptime)
                }
            }
            .navigationBarItems(leading: Text("运动记录").font(.title2).fontWeight(.heavy).offset(x: 10).offset(y: 10), trailing: Button(action: {
                self.isshowallrowcaloriesFakeDataView = false
            }, label: {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.down.circle")
                        .foregroundColor(.blue)
                })
                .offset(y: 10)
                
            }))
        }
        .navigationBarBackButtonHidden(true)
        
//        .overlay(alignment : .topLeading){
//            Button(action: {
//                choose3Dmodeldata.isshowAllRowCaloriesFakeDataView = false
//            }, label: {
//                Text("取消")
//                .foregroundColor(.white)
//                .frame(width: 130,height: 40)
//                .background(LinearGradient(colors: [Color(CGColor(red: 238/255, green: 17/255, blue: 238/255, alpha: 1.0)),Color(CGColor(red: 247/255, green: 9/255, blue: 56/255, alpha: 1.0))], startPoint: .leading, endPoint: .trailing))
//                .cornerRadius(20)
//            })
//        }
        
    }
}
