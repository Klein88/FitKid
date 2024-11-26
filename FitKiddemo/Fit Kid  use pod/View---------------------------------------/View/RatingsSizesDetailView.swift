//
//  RatingsSizesDetailView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/14.
//

import SwiftUI

struct RatingsSizesDetailView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            //评星
            VStack(alignment: .leading, spacing: 3) {
                Text("评星")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(colorGray)
                HStack(alignment: .center, spacing: 3) {
                    ForEach(1...5, id: \.self){
                        item in
                        Button(action: {}, label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(colorGray.cornerRadius(5))
                                .foregroundColor(.white)
                        })
                    }
                }
            }
        }
    }
}

struct RatingsSizesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsSizesDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
