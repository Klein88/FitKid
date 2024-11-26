//
//  FitKidQuickPoseView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/16.
//

import SwiftUI
import QuickPoseCore
import QuickPoseCamera
import QuickPoseSwiftUI
import QuickPoseMP
import SlideOverCard
struct FitKidQuickPoseView : View {
    @EnvironmentObject var choose3Dmodel : Choose3DModelData
    //MARK: -- sdkKey
    private var quickpose = QuickPose(sdkKey: "01H3BW33AYCH3PND1VW0KW9QKQ")
    @State var overlayimage : UIImage? = nil
    @State var isuserfrontcamera : Bool = false
    @State var isusesheet : Bool = false
    @State private var cameraViewOpacity: Double = 0
    @State var selectedfeatures : [QuickPose.Feature] = [.fitness(.jumpingJacks)]
    @State private var feedbackText : String? = nil
    @State private var counter = QuickPoseThresholdCounter()
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //MARK: --------
    @State var SetTime : Int = 120
    @State var useTime : Int = 0
    @State var jumpsecond : Int = 0
    @State var distributejumpsecond : Int = 0
    @State var remainingjumpsecond : Int = 120
   
    var body: some View {
        ZStack
        {
            QuickPoseCameraSwitchView(useFrontCamera: $isuserfrontcamera, delegate: quickpose)
            QuickPoseOverlayView(overlayImage: $overlayimage)
//            Button(action: {
//                self.isusesheet = true
//            }, label: {
//                Text("1111")
//            })
            if self.SetTime == 0
            {
                Text("运动结束,您跳了\(self.jumpsecond)次 , 用时\(self.useTime)秒")
                    .frame(width: UIScreen.main.bounds.width - 80  , height: 40)
                    .background(.white)
                    .foregroundColor(.blue)
                    .cornerRadius(20)
                    .onAppear{
                        self.stoptime()
                    }
            }
        }
        .slideOverCard(isPresented: $isusesheet)
        {
            ImagePicker(sourceType: .camera, onImagePicked:{
                uiimage in
            })
        }
        .onAppear{
            self.SetTime = choose3Dmodel.setTime
            self.useTime = 0
            self.remainingjumpsecond = self.distributejumpsecond
            self.distributejumpsecond = Int(Int(choose3Dmodel.height)! * Int(choose3Dmodel.heavy)! / 40)
            quickpose.start(features: selectedfeatures, onStart: {
                withAnimation { cameraViewOpacity = 1.0 }
            }, onFrame: { status , image , features , feedback , landmarks in
                switch status {
                        case .success:
                            overlayimage = image
                    if self.SetTime != 0{
                        if let result = features.values.first  {
                            let counterState = counter.count(result.value)
                            feedbackText = "跳了\(counterState.count) 次"
                            self.jumpsecond = counterState.count
                        } else {
                            feedbackText = nil
                        }
                    }
                        case .noPersonFound:
                            feedbackText = "请站在相机内";
                        case .sdkValidationError:
                            feedbackText = "请返回";
                    }
            })
            
            
        }
        .onReceive(timer){
            _ in
            self.SetTime -= 1
            self.useTime += 1
            self.remainingjumpsecond = self.distributejumpsecond - self.jumpsecond
        }
        .overlay(alignment: .bottom) {
            if let feedbackText = feedbackText {
                Text(feedbackText)
                    .font(.system(size: 26, weight: .semibold)).foregroundColor(.white).multilineTextAlignment(.center)
                    .padding(16)
                    .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.blue.opacity(0.8)))
                    .padding(.bottom, 40)
            }
        }
        .overlay(alignment: .top)
        {
            Text("还剩\(self.SetTime)秒,还剩\(self.remainingjumpsecond)次")
                .frame(width: UIScreen.main.bounds.width / 2)
                .padding(.trailing , 20)
                .foregroundColor(.white)
                .fontWeight(.heavy)
                .cornerRadius(20)
                .offset(y: 20)
                
        }
        .overlay(alignment: .topLeading)
        {
            Button(action: {
                choose3Dmodel.issport = false
            }, label: {
                Image(systemName: "chevron.backward.circle")
                    .scaleEffect(1.5)
                    .foregroundColor(.white)
            })
            .offset(x: 20)
            .offset(y: 20)
        }
    }
}
