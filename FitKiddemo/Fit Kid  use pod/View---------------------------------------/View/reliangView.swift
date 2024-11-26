//
//  reliangView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/14.
//

import SwiftUI

struct reliangView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            ZStack {
                Image("reliang")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .frame(width: 75, height: 75)
                    .foregroundColor(Color("reliang1"))
                    .background(Color("reliang"))
                    .cornerRadius(20)
            }
            VStack {
                Text("热量")
                    .font(.title3)
                    .fontWeight(.black)
                    .padding(10)
                    .foregroundColor(Color("reliang1"))
                    
                Text("14g")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct reliangView_Previews: PreviewProvider {
    static var previews: some View {
        reliangView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
