//
//  ObjectScan.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/14.
//

import SwiftUI
import ARKit
import CoreML

struct ObjectScan: View {
    @State private var model: VNCoreMLModel?
    @State private var currentLabel: String = "正在扫描 请稍等..."
    @State private var scannedFoodName: String = ""
    //添加扫描的食物名称，用state保存
    @State private var isFoodDetailPresented = false
    @Environment(\.presentationMode) var presentationMode
    @Binding var foodRecords: [Food]
    //添加binding接收foodRecords
    
    var body: some View {
        ZStack {
            ARViewContainer(model: $model, currentLabel: $currentLabel)
            VStack {
                Text(currentLabel)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .padding()
                Spacer()
                Button("保存该食物") {
                    //保存食物名
                    scannedFoodName = currentLabel

                    isFoodDetailPresented = true
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                .fullScreenCover(isPresented: $isFoodDetailPresented) {
                     FoodDetailView(onDismiss: {
                         presentationMode.wrappedValue.dismiss()
                     }, foodName: scannedFoodName, foodRecords: $foodRecords)
                    //将这里将scannedFoodName传给FoodDetailView的foodName
                    //在这里将foodRecords传递给FoodDetailView
                 }
//                .fullScreenCover(isPresented: $isFoodDetailPresented) {
//                    FoodDetailView(onDismiss: {
//                        presentationMode.wrappedValue.dismiss()
//                    }, foodName: currentLabel, foodRecords: $foodRecords)
//                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            do {
//                model = try VNCoreMLModel(for: FoodImageObject().model)
                model = try VNCoreMLModel(for: food().model)
            } catch {
                print("Failed to load model: \(error)")
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var model: VNCoreMLModel?
    @Binding var currentLabel: String

    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView(frame: .zero)
        arView.delegate = context.coordinator
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        arView.session.run(configuration)
        return arView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: ARViewContainer

        init(_ parent: ARViewContainer) {
            self.parent = parent
        }

        func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
            guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
//            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
//            let planeNode = SCNNode(geometry: plane)
//            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
//            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            plane.firstMaterial?.diffuse.contents = UIColor.clear
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
            node.addChildNode(planeNode)
        }

        func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
            guard let pixelBuffer = (renderer as? ARSCNView)?.session.currentFrame?.capturedImage else { return }
            let request = VNCoreMLRequest(model: parent.model!) { (request, error) in
                if let results = request.results as? [VNClassificationObservation] {
                    DispatchQueue.main.async {
                        self.parent.currentLabel = results.first?.identifier ?? "正在扫描 请稍等..."
                    }
                }
            }
            try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
        }
    }
}
