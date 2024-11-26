//
//  FoodDetailView.swift
//  FitKid
//
//  Created by 许鹏程 on 2023/6/12.
//

import SwiftUI

struct FoodDetailView: View {
    var onDismiss: () -> Void
    @State private var isAnimating: Bool = false
    @State private var showAlert: Bool = false
    //显示警告框
    var foodName: String
    //用于显示食物名称 在ObjectScan点击保存后将食物名称传到这
    @Binding var foodRecords: [Food]
    //接收foodRecords 保存更新foodRecords
    @Environment(\.presentationMode) var presentationMode
    //使用上面这个来关闭FoodDetailView
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            NavigationBarDetailView()
                .padding(.horizontal, 15)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            VStack(alignment: .leading,spacing: 5){
                HStack(alignment: .center, spacing: 6) {
                    Spacer()
                    Image(foodName)
                    //foodName与assets里照片名对应
                        .resizable()
                        .frame(width: 300, height: 250, alignment: .center)
                        .offset(y: isAnimating ? 0 : -35)
                    Spacer()
                }
                .onAppear(){
                    withAnimation(.easeOut(duration: 0.75)) {
                        isAnimating.toggle()
                    }
                }
                    .padding(.horizontal)
                    .zIndex(0)
               
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("食物")
                    Text(foodName)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .padding(.horizontal)
                .zIndex(1)
                .foregroundColor(.black)
                
                VStack(alignment: .center, spacing: 0) {
//                    HStack {
//                        RatingsSizesDetailView()
//                        Spacer()
//                    }
                    
                    Divider()
                        .padding(10)
                    
                    VStack {
                        HStack {
                            Text("饮食标记")
                                .fontWeight(.bold)
                            Spacer()
                        }
                        HStack {
                            zaocan()
                        }
                        .offset(y: -10)
                        .offset(x: -10)
                    }
                    
                    Divider()
                        .padding(5)
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("营养档案")
                                .fontWeight(.bold)
                            Spacer()
                            Text("每100克可食用部分")
                                .font(.footnote)
                        }
                        
                        HStack(alignment: .bottom) {
                            //tanshuiView()
                            HStack(alignment: .top, spacing: 6) {
                                ZStack {
                                    Image("tanshui")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(10)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(Color("tanshui1"))
                                        .background(Color("tanshui"))
                                        .cornerRadius(20)
                                }
                                VStack {
                                    Text("碳水")
                                        .font(.title3)
                                        .fontWeight(.black)
                                        .padding(10)
                                        .foregroundColor(Color("tanshui1"))
                                        
                                    Text("42.8 g")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                }
                            }
                            .offset(x: 10)
                            
                            //danbaizhiView()
                            HStack(alignment: .top, spacing: 6) {
                                ZStack {
                                    Image("danbaizhi")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(10)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(Color("danbaizhi1"))
                                        .background(Color("danbaizhi"))
                                        .cornerRadius(20)
                                }
                                VStack {
                                    Text("蛋白质")
                                        .font(.title3)
                                        .fontWeight(.black)
                                        .padding(10)
                                        .foregroundColor(Color("danbaizhi1"))
                                    var danbaizhi = Double.random(in: 0...1)
                                    Text("9.6 g")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                }
                            }
                            .offset(x: 40)
                        }
                        .padding(15)
                        HStack(alignment: .bottom) {
                            //zhifangView()
                            HStack(alignment: .top, spacing: 6) {
                                ZStack {
                                    Image("zhifang")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(10)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(Color("zhifang1"))
                                        .background(Color("zhifang"))
                                        .cornerRadius(20)
                                }
                                VStack {
                                    Text("脂肪")
                                        .font(.title3)
                                        .fontWeight(.black)
                                        .padding(10)
                                        .foregroundColor(Color("zhifang1"))
                                        
                                    Text("4.5 g")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                }
                            }
                            .offset(x: 15)
                            
                            //reliangView()
                            HStack(alignment: .top, spacing: 6) {
                                ZStack {
                                    Image("reliang")
                                        .resizable()
                                        .scaledToFit()
                                        .padding(10)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(Color("reliang1"))
                                        .background(Color("reliang"))
                                        .cornerRadius(20)
                                }
                                VStack {
                                    Text("热量")
                                        .font(.title3)
                                        .fontWeight(.black)
                                        .padding(10)
                                        .foregroundColor(Color("reliang1"))
                                        
                                    Text(" 249 kcal")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                }
                            }
                            .offset(x: 45)
                        }
                        .padding(10)
                    }

                    Divider()
                        .padding(5)
                    
                    Button(action: {
                        //跳转到食物主界面
                        foodRecords.append(Food(id: foodRecords.count + 1, name: foodName, image: foodName, caloric: Int.random(in: 80...300), description: "Delicious food", color: [Double.random(in: 0...1), Double.random(in: 0...1), Double.random(in: 0...1)]))
                        //这里要与Food结构体里的参数一一对应
                        showAlert = true
                    }, label: {
                        Spacer()
                        Image(systemName: "book")
                            .foregroundColor(.white)
                        Text("保存食物记录")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                    })
                    .alert(isPresented: $showAlert) {
                         Alert(title: Text("保存成功"), message: Text("食物模型已保存"), dismissButton: .default(Text("好的")) {
                             presentationMode.wrappedValue.dismiss()
                             onDismiss()
                         })
                    }
                    .padding(15)
                    .background(Color(
                        "pick"))
                    .clipShape(Capsule())
                }
                .padding(.horizontal)
                .background(Color.white.clipShape(CustomShape()).padding(.top, -105)
                    .padding(.bottom, -20)
                )
            }
            
            Spacer()
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Image("foodDetailBackground")
                .offset(y: -100)
            .ignoresSafeArea(.all, edges: .all)
        )
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    @State static var foodRecords: [Food] = []
    //创建静态Binding模拟状态改变
    static var foodRecordsBinding: Binding<[Food]> {
            Binding<[Food]>(
                get: { self.foodRecords },
                set: { self.foodRecords = $0 }
            )
        }
        static var previews: some View {
            FoodDetailView(onDismiss: {}, foodName: "hamburger", foodRecords: foodRecordsBinding)
                .previewLayout(.fixed(width: 375, height: 812))
        }
}
