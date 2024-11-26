//
//  danbaizhiView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/14.
//

import SwiftUI

struct danbaizhiView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            ZStack {
                Image("danbaizhi")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color("danbaizhi1"))
                    .background(Color("danbaizhi"))
                    .cornerRadius(20)
            }
            VStack {
                Text("蛋白质")
                    .font(.title3)
                    .fontWeight(.black)
                    .padding(10)
                    .foregroundColor(Color("danbaizhi1"))
                    
                Text("21g")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct danbaizhiView_Previews: PreviewProvider {
    static var previews: some View {
        danbaizhiView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
