//
//  SportDetailItemView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/12.
//

import SwiftUI
import CardCarousel
import SlideOverCard


struct SportDetailItemView: View {
    @EnvironmentObject var choose3Dmodel : Choose3DModelData
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            ZStack{
                VStack
                {
                    InfiniteCarousel(cards: [Card({CardDetailItemView(image: "开合跳")}),Card({CardDetailItemView(image: "仰卧起坐")}),Card({CardDetailItemView(image: "跑步")}),Card({CardDetailItemView(image: "跳绳")})])
                        .shadow(radius:20 , x : 5 , y: 5)
                        .frame(height: UIScreen.main.bounds.height * 3 / 4)
                }
                .overlay(alignment: .topLeading, content: {
                    HStack {
                        Button(action: {
                            self.choose3Dmodel.isshowsportitemView = false
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.blue)
                        })
                        .offset(x: -30, y: -40)
                        Spacer()
                    }
                })
            }
            .onAppear{
                choose3Dmodel.issport = false
            }
            .slideOverCard(isPresented: $choose3Dmodel.isshowsportIntroducename)
            {
                if(choose3Dmodel.sportIntroduceName == "开合跳")
                {
                    SlideoverCardItemView(name: choose3Dmodel.sportIntroduceName, introduce: "      锻炼心肺功能：开合跳是有氧和无氧的结合运动，能够快速提高心率，使心肺功能得到锻炼，对体能训练也是不错的选择。促进血液循环：人在运动的时候会扩张肌肉内的血管，使血液快速的流动，更多的血液会流动到心脏和肌肉中，心脏和肌肉得到充分的氧气，从而促进血液循环。增强身体的免疫力：通过开合跳运动全身的肌肉和关节都被牵扯，有利于活动关节，提高身体素质，增强身体的免疫力。")
                }
                else if choose3Dmodel.sportIntroduceName == "仰卧起坐"
                {
                    SlideoverCardItemView(name: choose3Dmodel.sportIntroduceName, introduce: "        可以减肥。要知道，肥胖不仅影响个人形象，也会损害身体健康，跑步可以说是一种最简单有效的减肥方式。如果能够长时间坚持跑步的话，减肥的效果是显而易见的，而且还可能会让你从此爱上跑步。可以改善视力。现在的大多数人，不是长期对着电脑，就是经常对着手机，视力在无形中不断下降。跑步时眼睛直视远方，面对大自然的花草树木，这对眼睛是很好的放松休息。")
                }
                else if choose3Dmodel.sportIntroduceName == "跑步"
                {
                    SlideoverCardItemView(name: choose3Dmodel.sportIntroduceName, introduce: "        减少腹部赘肉：仰卧起坐主要是锻炼腹部，能够起到减少腹部脂肪的情况，有利于减肥。增强腹肌：在进行仰卧起坐时，需要腹部的肌肉群发力，长期进行仰卧起坐能够增强腹部肌肉，提升腹部肌肉的力量。")
                    
                    
                }
                else if choose3Dmodel.sportIntroduceName == "跳绳"
                {
                    SlideoverCardItemView(name: choose3Dmodel.sportIntroduceName, introduce: "        锻炼多种脏器。跳绳能增强人体心血管、呼吸和神经系统的功能。研究证实，跳绳可以预防诸如糖尿病、关节炎、肥胖症、骨质疏松、高血压、肌肉萎缩、高血脂、失眠症、抑郁症、更年期综合征等多种症病。对哺乳期和绝经期妇女来说，跳绳还兼有放松情绪的积极作用，因而也有利于女性的心理健康。 ")
                    
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}

struct SportDetailItemView_Previews: PreviewProvider {
    static var previews: some View {
        SportDetailItemView()
            .environmentObject(Choose3DModelData())
           
    }
}
