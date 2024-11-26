//
//  textViewToSwiftUI.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/9.
//

import Foundation
import SwiftUI


struct testViewToSwiftUI : UIViewControllerRepresentable
{
    func makeUIViewController(context: Context) -> testView {
        return testView()
    }
    
    func updateUIViewController(_ uiViewController: testView, context: Context) {
        
    }
    
    typealias UIViewControllerType = testView
    
    
    
    
    
    
}
