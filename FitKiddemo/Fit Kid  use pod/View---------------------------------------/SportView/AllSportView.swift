//
//  AllSportView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/21.
//

import SwiftUI

struct AllSportView: View {
    @State var selection : Int = 0
    var body: some View {
        VStack{
            TabView(selection: $selection)
            {
                SportView()
                    .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
                    .tag(0)
                SportView_paiming()
                    .tag(1)
            }
            .frame(width: UIScreen.main.bounds.width)
            .tabViewStyle(.page)
            
        }
        .overlay(alignment: .top)
        {
            HStack
            {
                Button(action: {
                    selection = 0
                }, label: {
                    Text("运动")
                        .frame(width: 40)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .background(selection == 0 ? Color(CGColor(red: 169 / 255, green: 169 / 255, blue: 169 / 255, alpha: 1.0)) : .white.opacity(0))
                        .cornerRadius(10)
                })
                Text("    ")
                Button(action: {
                    selection = 1
                }, label: {
                    Text("排名")
                        .frame(width: 40)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .background(selection == 1 ? Color(CGColor(red: 169 / 255, green: 169 / 255, blue: 169 / 255, alpha: 1.0)) : .white.opacity(0))
                        .cornerRadius(10)
                    
                })
            }
            .frame(width: UIScreen.main.bounds.width , height: 50)
            .background(.gray.opacity(0.1))
        }
        
        
    }
}
