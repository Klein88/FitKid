//
//  ARContentView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/15.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct ARContentView : View {
    @State private var isPlacementEnabled = false
    @State private var selectedModel: Model?
    @State private var modelConfirmedForPlacement: Model?
    @Environment(\.presentationMode) var presentationMode

    private var models: [Model] = {
        //动态获取文件名
        let filemanager = FileManager.default

        guard let path = Bundle.main.resourcePath, let files = try?filemanager.contentsOfDirectory(atPath: path) else {
            return []
        }

        var availableModels: [Model] = []
        for filename in files where filename.hasSuffix("usdz") {
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: modelName)
            availableModels.append(model)
        }
        return availableModels
    }()
    var body: some View {
            ZStack(alignment: .bottom) {
                ARViewContainer1(modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
                if self.isPlacementEnabled {
                    PlacementButtonsView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: self.$selectedModel, modelConfirmedForPlacement: self.$modelConfirmedForPlacement)
                } else {
                    ModelPickerView(isPlacementEnabled: self.$isPlacementEnabled, selectedModel: $selectedModel,models: self.models)
                }

                // 添加取消按钮
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.white)
                        })
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
            }
        }
        
    }

struct ARViewContainer1: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: Model?

    func makeUIView(context: Context) -> CustomARView {
        let arView = CustomARView(frame: .zero)
        return arView
    }

//    func updateUIView(_ uiView: CustomARView, context: Context) {
//        if let model = self.modelConfirmedForPlacement {
//            if let modelEntity = model.modelEntity {
//                print("DEBUG: adding model to scene \(model.modelName)")
//                let anchorEntity = AnchorEntity(plane: .any)
//                anchorEntity.addChild(modelEntity.clone(recursive: true))
//
//                uiView.scene.addAnchor(anchorEntity)
//            } else {
//                print("DEBUG: Unable to load modelEntity for \(model.modelName)")
//            }
//            DispatchQueue.main.async {
//                self.modelConfirmedForPlacement = nil
//            }
//        }
//    }
    func updateUIView(_ uiView: CustomARView, context: Context) {
        if let model = self.modelConfirmedForPlacement {
            if let modelEntity = model.modelEntity {
                print("DEBUG: adding model to scene \(model.modelName)")
                let anchorEntity = AnchorEntity(plane: .any)
                anchorEntity.addChild(modelEntity.clone(recursive: true))

                uiView.scene.addAnchor(anchorEntity)
                uiView.placedModelAnchor = anchorEntity // Save the anchor
            } else {
                print("DEBUG: Unable to load modelEntity for \(model.modelName)")
            }
            DispatchQueue.main.async {
                self.modelConfirmedForPlacement = nil
            }
        }
    }

}

class CustomARView: ARView {
    var placedModelAnchor: AnchorEntity?
    let focusSquare = FESquare()

//    required init(frame frameRect: CGRect) {
//        super.init(frame: frameRect)
//
//        focusSquare.viewDelegate = self
//        focusSquare.delegate = self
//        focusSquare.setAutoUpdate(to: true)
//
//        self.setupARView()
//    }
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)

        focusSquare.viewDelegate = self
        focusSquare.delegate = self
        focusSquare.setAutoUpdate(to: true)

        self.setupARView()
        self.setupGestures() // Set up the gestures
    }

    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupARView() {
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic

        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }

        self.session.run(config)
    }
    
    //1
    func setupGestures() {
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
            self.addGestureRecognizer(panGesture)

            let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
            self.addGestureRecognizer(pinchGesture)
        }

        @objc func handlePan(_ sender: UIPanGestureRecognizer) {
            guard let anchor = placedModelAnchor else { return }

            let translation = sender.translation(in: self)
            // You might need to adjust the translation values to match the AR world's scale
            let newPosition = SIMD3<Float>(anchor.transform.translation.x + Float(translation.x),
                                           anchor.transform.translation.y,
                                           anchor.transform.translation.z + Float(translation.y))
            anchor.transform.translation = newPosition
        }

        @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
            guard let anchor = placedModelAnchor else { return }

            let scale = Float(sender.scale)
            anchor.scale = SIMD3<Float>(scale, scale, scale)
        }
}

extension CustomARView: FEDelegate {
    func toTrackingState() {
        print("tracking")
    }

    func toInitializingState() {
        print("initializing")
    }
}

struct ModelPickerView: View {
    @Binding var isPlacementEnabled : Bool
    @Binding var selectedModel: Model?

    var models: [Model]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(0 ..< self.models.count) {
                    index in
                   Button (action: {
                        print("DEBUG: selected model with name \(self.models[index].modelName)")

                        self.selectedModel = self.models[index]

                        self.isPlacementEnabled = true
                    }) {
                        Image(uiImage: self.models[index].image)
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(Color.white)
                            .cornerRadius(12)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
        .padding(20)
        .background(Color.black.opacity(0.5))
    }
}

struct PlacementButtonsView: View {
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    var body: some View {
        HStack {
            //创建取消按钮
            Button(action: {
                print("DEBUG: model placement canceled.")

                self.resetPlacementParameters()
            }) {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }

            //确认按钮
            Button(action: {
                print("DEBUG: model placement confirmed.")
                self.modelConfirmedForPlacement = self.selectedModel
                self.resetPlacementParameters()
            }) {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }
    }
    func resetPlacementParameters() {
        self.isPlacementEnabled = false
        self.selectedModel = nil
    }
}

#if DEBUG
struct ARContentView_Previews : PreviewProvider {
    static var previews: some View {
        ARContentView()
    }
}
#endif

