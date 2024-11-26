//
//  Food.swift
//  FitKid
//
//  Created by 冯悦妍 on 2023/6/21.
//

import SwiftUI

struct Food_d: View {
    var body: some View {
        ZStack {
            Image("noddle").resizable().scaledToFit().frame(width: 100)
            Text("饮食").font(.title).fontWeight(.bold).foregroundColor(.orange).offset(x: -25, y: -80)
            Image(systemName: "shield").resizable().scaledToFit().frame(width: 30).foregroundColor(.brown).background().offset(x: 35, y: -123)
            Text("2").font(.headline).fontWeight(.bold).foregroundColor(.brown).offset(x: 35, y: -123)
        }.padding().padding(.top,60).background(Color.white.cornerRadius(12)).background(RoundedRectangle(cornerRadius: 12).stroke(Color.yellow,lineWidth: 6))
    }
}

struct Food_Previews: PreviewProvider {
    static var previews: some View {
        Food_d()
    }
}
