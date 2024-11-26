//
//  SlideoverCardItemView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/12.
//

import SwiftUI

struct SlideoverCardItemView: View {
    @State var name : String
    @State var introduce : String
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack{
            VStack(alignment: .leading,spacing: 5){
                HStack(alignment: .center, spacing: 6) {
                    Spacer()
                    //                            Image("background3")
                    Image("\(name+"-介绍")")
                    //foodName与assets里照片名对应
                        .resizable()
                        .frame(width: 300, height: 250, alignment: .center)
                        .offset(y: isAnimating ? 0 : -35)
                    Spacer()
                }
                .onAppear(){
                    withAnimation(.easeOut(duration: 0.75)) {
                        isAnimating.toggle()
                    }
                }
                .padding(.horizontal)
                .zIndex(0)
                
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("运动")
                    Text("\(name)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .padding(.horizontal)
                .zIndex(1)
                .foregroundColor(.black)
                
                VStack(alignment: .center, spacing: 0) {
                    Divider()
                        .padding(10)
                    
                    VStack {
                        HStack {
                            Text("运动消耗")
                                .fontWeight(.bold)
                            Spacer()
                            Image("xiaohaokcal")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    
                    Divider()
                        .padding(5)
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("运动介绍")
                                .fontWeight(.bold)
                            Spacer()
                        }
                        Text("\("\n"+introduce+"\n")")
                    }
                    
                }
                .padding(.horizontal)
                .background(Color.white.clipShape(CustomShape()).padding(.top, -105)
                    .padding(.bottom, -20)
                )
            }
            .offset(y: -70)
        }
    }
}

struct SlideoverCardItemView_Previews: PreviewProvider {
    static var previews: some View {
        SlideoverCardItemView(name: "开合跳", introduce: " 锻炼心肺功能：开合跳是有氧和无氧的结合运动，能够快速提高心率，使心肺功能得到锻炼，对体能训练也是不错的选择。促进血液循环：人在运动的时候会扩张肌肉内的血管，使血液快速的流动，更多的血液会流动到心脏和肌肉中，心脏和肌肉得到充分的氧气，从而促进血液循环。增强身体的免疫力：通过开合跳运动全身的肌肉和关节都被牵扯，有利于活动关节，提高身体素质，增强身体的免疫力。")
    }
}
