//
//  zaocan.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/18.
//

import SwiftUI

struct zaocan: View {
    // 创建一个数组来保存所有的图片名称
        var imageNames: [String] = ["shuiguo", "zaocan", "zhongcan", "wancan"]
        // 创建一个State来保存当前选中的图片
        @State private var selectedImage: String? = nil
        // 创建一个State来保存是否显示抖动效果
        @State private var shake = false
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(imageNames, id: \.self) { imageName in
                        Button(action: {
                            self.selectedImage = imageName
                            self.shake = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.shake = false
                            }
                        }) {
                            Image(imageName)
                                .resizable()
                                .frame(width: 80, height: 100)
                                .shadow(color: self.selectedImage == imageName ? .gray : .clear, radius: 1)
                                .rotationEffect(.degrees(self.shake && self.selectedImage == imageName ? 20 : 0))
                                .animation(self.shake && self.selectedImage == imageName ? Animation.linear(duration: 0.1).repeatCount(2, autoreverses: true) : .default)
                        }
                    }
                }
                .padding()
            }
        }
}

struct zaocan_Previews: PreviewProvider {
    static var previews: some View {
        zaocan()
    }
}
