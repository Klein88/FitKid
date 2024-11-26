//
//  RobotModelApiForAR.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/12.
//

import Foundation
import ARKit
import RealityKit
import Combine
var robotCharacter : BodyTrackedEntity?
let robotOffset : SIMD3<Float> = [-1.0 , 0 , 0]
let robotAnchor  = AnchorEntity()
extension ARView : ARSessionDelegate
{
    func loadRobot()
    {
        var cancellabel : AnyCancellable? = nil
        cancellabel = Entity.loadBodyTrackedAsync(named: "robot.usdz").sink(receiveCompletion: {
            completion in
            if case let . failure(error) = completion{
                print("无法加载模型，错误：\(error.localizedDescription)")
            }
            cancellabel?.cancel()
        }, receiveValue: {
            (character : Entity) in
            if let character = character as? BodyTrackedEntity{
                character.scale = [1.0,1.0,1.0]
                robotCharacter = character
                self.scene.addAnchor(robotAnchor)
                cancellabel?.cancel()
            }
            else
            {
                print("模型格式不正确，不能解析成人体骨骼")
            }
        })
    }
    
    public func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
        for anchor in anchors {
            guard let bodyAnchor = anchor as? ARBodyAnchor else
            {
                continue
            }
            let bodyPosition = simd_make_float3(bodyAnchor.transform.columns.3)
            robotAnchor.position = bodyPosition + robotOffset
            robotAnchor.orientation = Transform(matrix: bodyAnchor.transform).rotation
            if let character = robotCharacter , character.parent == nil{
                robotAnchor.addChild(character)
            }
        }
    }
}




