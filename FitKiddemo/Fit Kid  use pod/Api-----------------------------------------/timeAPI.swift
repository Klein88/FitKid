//
//  timeAPI.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/16.
//

import Foundation


extension FitKidQuickPoseView
{
    func stoptime()
    {
        self.timer.upstream.connect().cancel()
    }
    
    func starttime()
    {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}

extension FitKidQuickPoseView_Situps
{
    func stoptime()
    {
        self.timer.upstream.connect().cancel()
    }
    
    func starttime()
    {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}

extension ARRobotView
{
    func stoptime()
    {
        self.timer.upstream.connect().cancel()
    }
    
    func starttime()
    {
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
}
