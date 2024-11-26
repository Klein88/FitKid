//
//  AVcameraViewToSwiftUI.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/12.
//

import Foundation
import SwiftUI
import UIKit


struct AVcameraViewToSwiftUI : UIViewControllerRepresentable
{
    func makeUIViewController(context: Context) -> AVcameraView {
        return AVcameraView()
    }
    
    func updateUIViewController(_ uiViewController: AVcameraView, context: Context) {
        
    }
    
    typealias UIViewControllerType = AVcameraView
    
}
