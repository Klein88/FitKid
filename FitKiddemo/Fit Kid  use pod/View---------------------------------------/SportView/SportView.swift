
import SwiftUI
import SceneKit

import SwiftUICharts
struct SportView: View {
    @State var uiimage = UIImage(named: "takephoto")
    @State var ispresented_camera : Bool = false
    @State var ispresented_photo : Bool = false
    @State var height : String  = ""
    @State var heavy : String = ""
    @EnvironmentObject var choose3Dmodel  : Choose3DModelData
    @EnvironmentObject var caloriesfakedata : CaloriesFakeData
    @State var ischoose : Bool = false
    @State var isshowAllRowCaloriesFakeDataView : Bool = false
    @State var nian_yue_ri : String = "年"
    var body: some View {
            ZStack
            {
               Image("bgfinal")
                    .resizable()
                    .frame(width:700, height: 1300)
                    .zIndex(0)
                    VStack
                    {
                        VStack
                        {
                            Image(uiImage: uiimage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: UIScreen.main.bounds.height / 4)
                                .shadow(radius: 2)
                                .cornerRadius(10)
                                .offset(y:15)
                            HStack{
                                Button(action: {
                                    self.ispresented_camera = true
                                }, label: {
                                    Text("拍摄")
                                        .foregroundColor(.white)
                                        .frame(width: 130,height: 40)
                                        .background(Color.orange)
                                        .cornerRadius(20)
                                })
                                Button(action: {
                                    self.ispresented_photo = true
                                }, label: {
                                    Text("选择相册图片")
                                        .foregroundColor(.white)
                                        .frame(width: 130,height: 40)
                                        .background(Color.orange)
                                        .cornerRadius(20)
                                })
                            }
                            
                        }
                        .offset(y:10)
                        

                        HStack{
                            VStack
                            {
                                Text("选择我的模型")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .font(.title3)
                                Button(action: {
                                    ischoose = true
                                }, label: {
                                    SceneView(scene: SCNScene(named: choose3Dmodel.tDModelNameToChoose) , options: [.allowsCameraControl , .autoenablesDefaultLighting])
                                        .frame(width: 170 , height: 240)
                                })
                                .frame(width: 170 , height: 240)
                                .shadow(radius: 10)
                                .cornerRadius(20)
                                
                            }
                            .offset(x: -10)

                            VStack{
                            HStack {
                                Text("我的数据")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .font(.title3)
                                    .offset(y: -10)
                            }
                            HStack {
                                BarChartView(data: ChartData(values: [(caloriesfakedata.data_day[0].time , Double(caloriesfakedata.data_day[0].calories)),(caloriesfakedata.data_day[1].time , Double(caloriesfakedata.data_day[1].calories)),(caloriesfakedata.data_day[2].time , Double(caloriesfakedata.data_day[2].calories)),(caloriesfakedata.data_day[3].time , Double(caloriesfakedata.data_day[3].calories)),(caloriesfakedata.data_day[4].time , Double(caloriesfakedata.data_day[4].calories)),(caloriesfakedata.data_day[5].time , Double(caloriesfakedata.data_day[5].calories))]), title: "卡路里消耗" ,legend: "/天" )
                                    .frame(width: 170 , height: 220)
                            }
                        }
                        }
                        .offset(y:10)
                        HStack{
                            
                            VStack {
                                Text("我的信息")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .font(.title3)
                                    .offset(x: -130)
                                HStack {
                                    VStack
                                    {
                                        HStack {
                                            Text("我的身高")
                                                .foregroundColor(.blue)
                                                .font(.title3)
                                            Text("/cm")
                                                .foregroundColor(.blue)
                                        }
                                        .offset(y: 10)
                                        TextField("身高", text: $choose3Dmodel.height)
                                            .offset(x: 60)
                                            .fontWeight(.bold)
                                            .font(.title)
                                            .foregroundColor(.blue)
                                    }
                                    .frame(width: 160 ,height: 70)
                                    .background(Color("background2"))
                                    .cornerRadius(10)
                                    .padding(10)
                                    VStack
                                    {
                                        HStack {
                                            Text("我的体重")
                                                .foregroundColor(.blue)
                                                .font(.title3)
                                            Text("/kg")
                                                .foregroundColor(.blue)
                                        }
                                        .offset(y: 10)
                                        TextField("体重", text: $choose3Dmodel.heavy)
                                            .offset(x: 60)
                                            .fontWeight(.bold)
                                            .font(.title)
                                            .foregroundColor(.blue)
                                    }
                                    //                            .frame(width: UIScreen.main.bounds.width - 70 , height: 70)
                                    .frame(width: 160 ,height: 70)
                                    .background(Color("background2"))
                                    .cornerRadius(10)
                                }
                                .offset(y: -10)
                            }
                        }
                        .offset(y: 20)
                        Button(action: {
                            self.choose3Dmodel.isshowsportitemView = true
                        }, label: {
                            Text("开始运动")
                                .font(.system(size: 20))
                                .frame(width: 150 , height: 50)
                                .foregroundColor(Color("button"))
                                .fontWeight(.bold)
                                .background(Color("background9"))
                                .cornerRadius(30)
                        })

                    }//MARK: --VStack
                    .sheet(isPresented: $ispresented_camera, content: {
                        ImagePicker(sourceType: .camera, onImagePicked: {
                            Uiimage in
                            self.uiimage = Uiimage
                        })
                    })
                    .fullScreenCover(isPresented: $isshowAllRowCaloriesFakeDataView){
                        AllRowCaloriesFakeDataView(isshowallrowcaloriesFakeDataView: $isshowAllRowCaloriesFakeDataView)
                    }
                    .sheet(isPresented: $ispresented_photo, content: {
                        ImagePicker(sourceType: .photoLibrary, onImagePicked: {
                            Uiimage in
                            self.uiimage = Uiimage
                        })
                    })
                if choose3Dmodel.isshowChartView == true
                {
                    ChartView(name: self.nian_yue_ri)
                        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
                        .background(.white)
                        .offset(y: 150)
                        .cornerRadius(20)
                        .shadow(radius: 40 , x: 5 , y:5)
                }
                
                if ischoose == true
                {
                    choose3DModel(ischoose: $ischoose)
                        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 3 / 4)
                        .cornerRadius(40)
                        .shadow(radius: 10 , x: 5 , y: 5)
                }
                
                if choose3Dmodel.isshowsportitemView == true
                {
                    SportDetailItemView()
                        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height )
                        .background(.white)
                }
            }
        
        
    }
}

struct SportView_Previews: PreviewProvider {
    static var previews: some View {
        TabLayoutView()
            .environmentObject(Choose3DModelData())
    }
}
