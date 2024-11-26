//
//  JiHuaRowView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/25.
//

import SwiftUI

struct JiHuaRowView: View {
    @State var chooseColor : Int
    @State var starttime : Date
    @State var endtime : Date
    @State var shixiang : String
    @State var fujia : [String]
    var body: some View {
        VStack
        {
            HStack
            {
                Divider()
                    .frame(width: 5, height: 60)
                    .foregroundColor(chooseColor(it: chooseColor))
                    .background(chooseColor(it: chooseColor))
                    .padding(.leading , 20)
                
                VStack
                {
                    Text("\(shixiang)")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                    Text("\(Calendar.current.component(.hour, from: starttime)):\(Calendar.current.component(.minute, from: starttime)) - \(Calendar.current.component(.hour, from: endtime)):\(Calendar.current.component(.minute, from: endtime))")
                        .font(.system(size: 15))
                        .foregroundColor(.gray.opacity(0.8))
                }
                .padding(.leading , 10)
                Spacer()
                Menu
                {
                    Button(action: {
                        
                    }, label: {
                        Text("删除")
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("修改")
                    })
                }label: {
                    Image(systemName: "list.dash")
                }
                .padding(.trailing , 20)
            }
            HStack
            {
                Text("  ")
                ForEach(fujia , id: \.self)
                {
                    it in
                    Text("\(it)")
                        .frame(width: 40 , height: 20)
                        .foregroundColor(chooseColor(it: chooseColor))
                        .font(.system(size: 10))
                        .background(chooseColor(it: chooseColor).opacity(0.3))
                        .padding(.leading , 10)
                        .cornerRadius(5)
                }
                Spacer()
            }
            
        }
        .frame(width: UIScreen.main.bounds.width - 50 , height: 130)
        .background(.gray.opacity(0.1))
        .cornerRadius(20)
    }
}
