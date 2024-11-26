//
//  Sport.swift
//  FitKid
//
//  Created by 冯悦妍 on 2023/6/21.
//

import SwiftUI

struct Sport: View {
    var body: some View {
        ZStack {
            Image("sport").resizable().scaledToFit().frame(width: 100)
            Text("运动").font(.title).fontWeight(.bold).foregroundColor(Color.cyan).offset(x: -25, y: -80)
            Image(systemName: "shield").resizable().scaledToFit().frame(width: 30).foregroundColor(.brown).background().offset(x: 35, y: -123)
            Text("1").font(.headline).fontWeight(.bold).foregroundColor(.brown).offset(x: 35, y: -123)
        }.padding().padding(.top,60).background(Color.white.cornerRadius(12)).background(RoundedRectangle(cornerRadius: 12).stroke(Color.cyan,lineWidth: 6))
    }
}

struct Sport_Previews: PreviewProvider {
    static var previews: some View {
        Sport()
    }
}
