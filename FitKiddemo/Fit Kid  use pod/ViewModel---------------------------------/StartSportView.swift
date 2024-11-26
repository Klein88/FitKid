//
//  StartSportView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/12.
//

import SwiftUI

struct StartSportView: View {
    @EnvironmentObject var choose3Dmodel : Choose3DModelData
    @State var sportname : String
    var body: some View {
        ZStack{
            Color(.white)
            VStack
            {
                Text(sportname)
                Button(action: {
                    choose3Dmodel.issport = false
                }, label: {
                    Text("关闭（暂定）")
                })
                
                
                
                
            }
        }
        .ignoresSafeArea()
    }
}
