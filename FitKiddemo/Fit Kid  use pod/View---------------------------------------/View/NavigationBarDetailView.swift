//
//  NavigationBarDetailView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/12.
//

import SwiftUI

struct NavigationBarDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isDetail = false
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            })
            Spacer()
            Button(action: {
                isDetail = true
            }, label: {
                Image(systemName: "bell")
                    .font(.title)
                    .foregroundColor(.white)
            }).fullScreenCover(isPresented: $isDetail) {
                MealSchedule()
            }
        }
    }
}

struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
