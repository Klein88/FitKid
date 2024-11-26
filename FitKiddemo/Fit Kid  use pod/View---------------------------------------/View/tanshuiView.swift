//
//  tanshuiView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/14.
//

import SwiftUI

struct tanshuiView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            ZStack {
                Image("tanshui")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color("tanshui1"))
                    .background(Color("tanshui"))
                    .cornerRadius(20)
            }
            VStack {
                Text("碳水")
                    .font(.title3)
                    .fontWeight(.black)
                    .padding(10)
                    .foregroundColor(Color("tanshui1"))
                    
                Text("0g")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct tanshuiView_Previews: PreviewProvider {
    static var previews: some View {
        tanshuiView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
