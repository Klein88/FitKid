//
//  CaptureSampleView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/16.
//

import SwiftUI

struct CaptureSampleView: View {
    @ObservedObject var model: CameraViewModel
    
    var body: some View {
        ZStack {
            
            // Make the entire background black.
            Color.black.edgesIgnoringSafeArea(.all)
            CameraView(model: model)
        }
        // Force dark mode so the photos pop.
        .environment(\.colorScheme, .dark)
    }
}

struct CaptureSampleView_Previews: PreviewProvider {
    @StateObject private static var model = CameraViewModel()
    static var previews: some View {
        CaptureSampleView(model: model)
    }
}
