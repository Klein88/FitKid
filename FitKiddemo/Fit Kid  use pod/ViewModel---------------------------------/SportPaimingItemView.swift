//
//  SportPaimingItemView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/21.
//

import SwiftUI

struct SportPaimingItemView: View {
    @State var paiming : paimingTyoe
    var body: some View {
        HStack
        {
            Text("  \(paiming.paiming)  ")
                .font(.system(size: 20 ))
                .foregroundColor(Color(CGColor(red: 92 / 255, green: 4 / 255, blue: 51 / 255, alpha: 1.0)))
                .fontWeight(.heavy)
            HStack
            {
                Image(paiming.image)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 6)
                    .cornerRadius(20)
                    .padding(.leading , 10)
                Spacer()
                VStack
                {
                    Text("\(paiming.name)")
                        .offset(y: 20)
                    HStack
                    {
                        Image("jifen")
                            .scaleEffect(0.5)
                            .cornerRadius(20)
                        Text("\(paiming.jifeng) 分")
                            .foregroundColor(.gray)
                            
                    }
                }
                .offset(x: -30)
                Text("\(paiming.mingci)")
                    .foregroundColor(Color(CGColor(red: 92 / 255, green: 4 / 255, blue: 51 / 255, alpha: 1.0)))
                    .fontWeight(.heavy)
                    .offset(x: -10)
                Image(systemName: paiming.shangsheng ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .foregroundColor(paiming.shangsheng ? .green : .red)
                    .offset(x: -10)
            }
            .frame(width: UIScreen.main.bounds.width * 2 / 3 , height: 80)
            .background(.gray.opacity(0.1))
            .cornerRadius(20)
            
            //Color(CGColor(red: 169 / 255, green: 169 / 255, blue: 169 / 255, alpha: 1.0))
        }
        .frame(width: UIScreen.main.bounds.width)
        
    }
}
