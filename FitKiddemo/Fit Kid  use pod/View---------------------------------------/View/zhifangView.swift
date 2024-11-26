//
//  zhifangView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/14.
//

import SwiftUI

struct zhifangView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            ZStack {
                Image("zhifang")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color("zhifang1"))
                    .background(Color("zhifang"))
                    .cornerRadius(20)
            }
            VStack {
                Text("脂肪")
                    .font(.title3)
                    .fontWeight(.black)
                    .padding(10)
                    .foregroundColor(Color("zhifang1"))
                    
                Text("14g")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct zhifangView_Previews: PreviewProvider {
    static var previews: some View {
        zhifangView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
