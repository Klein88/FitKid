//
//  ModelRow.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/12.
//

import SwiftUI

struct ModelRow: View {
    var models = modelData
    @State var showContent = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
          Text("奖章")
             .font(.system(size: 35))
             .fontWeight(.heavy)
             .padding(.leading, 30)
             .foregroundColor(.black)
          Text("................")
              .padding(.leading, 30)
              .foregroundColor(.gray)
              .padding(.bottom, 10)

          ScrollView(.horizontal, showsIndicators: false) {
             HStack(spacing: 20) {
                ForEach(models) { item in
                   CertificateView(item: item)
                }
             }
             .padding(20)
             .padding(.leading, 10)
          }
       }
    }
}

struct ModelRow_Previews: PreviewProvider {
    static var previews: some View {
        ModelRow()
    }
}

struct Certificate: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var width: Int
   var height: Int
}

let modelData = [
   Certificate(title: "冠军🏆", image: "Certificate1", width: 230, height: 150),
   Certificate(title: "蔬菜沙拉", image: "Certificate2", width: 230, height: 150),
   Certificate(title: "积分卡", image: "Certificate3", width: 230, height: 150),
   Certificate(title: "补贴卡", image: "Certificate4", width: 230, height: 150)
]

