//
//  CardDetailItemView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/12.
//

import SwiftUI
import SlideOverCard
struct CardDetailItemView: View {
    @EnvironmentObject var choose3dmodel : Choose3DModelData
    @State var setTime : Int = 0
    @State var image : String
    var body: some View {
        VStack{
            HStack
            {
                Text("\(image)")
                    .foregroundColor(.white)
                    .font(.system(size:20))
                    .frame(width: 115, height: 40)
                    .background(Color.purple)
                    .cornerRadius(20)
                    .fontWeight(.heavy)
                    .padding(.leading , 25)
                    .onTapGesture {
                        choose3dmodel.sportIntroduceName = image
                        choose3dmodel.isshowsportIntroducename = true
                    }
                Spacer()
                HStack
                {
                    Picker("分钟" , selection: $setTime)
                    {
                        ForEach(0..<20)
                        {
                            it in
                            Text("\(it)")
                        }
                    }
                    .pickerStyle(.inline)
                    .scaleEffect(0.5)
                    Text("分钟")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                        .offset(x: -10)
                }
            }
            VStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                Divider()
                Text("训练目标")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .offset(x: 10)
                
                Text("心肺耐力｜动作速度｜肌肉耐力")
                    .offset(y: 5)
                    .foregroundColor(.gray)
                Divider()
                Text("最高纪录")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: 10)
                HStack {
                    Text("奖牌")
                    Text("最佳成绩 30 次")
                        .foregroundColor(.gray)
                }
                .offset(y: 5)
            }.offset(y: -50)
            
            Button(action: {
                choose3dmodel.sportname = image
                choose3dmodel.issport = true
                choose3dmodel.setTime = self.setTime * 60
            }, label: {
                Text("开始运动")
                    .foregroundColor(.black)
                    .frame(width: 130,height: 40)
                    .background(Color("ks"))
                    .fontWeight(.bold)
                    .cornerRadius(20)
                    .shadow(radius: 10)
            })
            .offset(y: -30)
            Spacer()
        }
        .onAppear{
            choose3dmodel.issport = false
        }
       
    }
}
