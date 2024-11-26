//
//  Model.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/14.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancelable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        self.cancelable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                //处理错误
                print("DEBUG: Unable to load modelEntity for modelName: \(self.modelName)")
            }, receiveValue: { modelEntity in
                //获得模型
                self.modelEntity = modelEntity
                print("DEBUG: Successfully loaded modelENtity for modelName: \(self.modelName)")
            })
    }
}
