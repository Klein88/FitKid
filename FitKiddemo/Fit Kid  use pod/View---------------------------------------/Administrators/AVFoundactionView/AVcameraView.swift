//
//  AVcameraView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/12.
//

import Foundation
import UIKit
import AVFoundation



class AVcameraView : UIViewController
{
    let session = AVCaptureSession()
    let device = AVCaptureDevice.devices(for: .video)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let input =  try? AVCaptureDeviceInput(device: device[0]) else
        {
           fatalError("error for the input ")
       }
        
        session.addInput(input)
        session.startRunning()
        
    }
}
