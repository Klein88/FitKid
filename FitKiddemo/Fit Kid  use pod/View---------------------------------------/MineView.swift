import SwiftUI

struct MineView: View {
    @EnvironmentObject var choose3Dmodeldata : Choose3DModelData
    @State var isHonor = false
    var body: some View {
        NavigationView {
            VStack {
                
                Image("touxiang1").resizable().scaledToFit().frame(width: 150).clipShape(Circle()).background(Color.white).cornerRadius(80).offset(y: 80)
                Text("小明").font(.title).fontWeight(.bold).foregroundColor(.white).offset(y: 75)
                HStack {
                    ZStack {
                        Badge2().scaledToFit().frame(width: 60)
                        Badge1().scaledToFit().frame(width: 50)
                        Text("4").font(.title).fontWeight(.bold).foregroundColor(.white)
                    }.padding().offset(x: -5,y: 90)
                    VStack {
                        HStack {
                            Image(systemName: "c.circle").font(.subheadline).fontWeight(.bold).foregroundColor(.pink)
                            Text("4110").font(.title3)
                        }.padding(.bottom,1)
                        Text("总积分").font(.subheadline)
                    }.padding().offset(x: 10,y: 90)
                    VStack {
                        HStack {
                            Image(systemName: "chart.bar").font(.subheadline).fontWeight(.bold).foregroundColor(.pink)
                            Text("329").font(.title3)
                        }.padding(.bottom,1)
                        Text("排行榜").font(.subheadline)
                    }.padding().offset(x: 10,y: 90)
                }
                ScrollView(.vertical) {
                    Button {
                        isHonor = true
                    } label: {
                        HStack {
                            Image(systemName: "envelope").font(.title).fontWeight(.bold).foregroundColor(.mint).background(Color.white).padding().background(Circle().stroke(Color.gray,lineWidth: 1)).padding(.trailing,29).padding(.leading,1)
                            HStack {
                                Text("奖章")
                                Spacer()
                                Image(systemName: "arrowshape.turn.up.right.circle")
                            }.foregroundColor(.mint).padding().background(Color.white.cornerRadius(12)).background(RoundedRectangle(cornerRadius: 12).stroke(Color.green, lineWidth: 2))
                        }.padding(.vertical).padding(.horizontal,10)
                    }
                    .fullScreenCover(isPresented: $isHonor) {
                        HonorView()
                    }

                    
                    NavigationLink {
                        TDShareView()
                    } label: {
                        HStack {
                            Image(systemName: "person.crop.artframe").font(.title).fontWeight(.bold).foregroundColor(.pink).background(Color.white).padding().background(Circle().stroke(Color.gray,lineWidth: 1)).padding(.trailing,32).padding(.leading,4)
                            HStack {
                                Text("展示虚拟形象")
                                Spacer()
                                Image(systemName: "arrowshape.turn.up.right.circle")
                            }.foregroundColor(.pink).padding().background(Color.white.cornerRadius(12)).background(RoundedRectangle(cornerRadius: 12).stroke(Color.purple, lineWidth: 2))
                        }.padding(.horizontal,10)
                    }
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "homekit").font(.title).fontWeight(.bold).foregroundColor(.green).background(Color.white).padding().background(Circle().stroke(Color.gray,lineWidth: 1)).padding(.trailing,27).padding(.leading,-1)
                            HStack {
                                Text("设置")
                                Spacer()
                                Image(systemName: "arrowshape.turn.up.right.circle")
                            }.foregroundColor(.green).padding().background(Color.white.cornerRadius(12)).background(RoundedRectangle(cornerRadius: 12).stroke(Color.blue, lineWidth: 2))
                        }.padding(.horizontal,10).padding(.top)
                    }
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Image(systemName: "pip.exit").font(.title).fontWeight(.bold).foregroundColor(.brown).background(Color.white).padding().background(Circle().stroke(Color.gray,lineWidth: 1)).padding(.trailing,25).padding(.leading,-1)
                            HStack {
                                Text("退出登录")
                                Spacer()
                                Image(systemName: "arrowshape.turn.up.right.circle")
                            }.foregroundColor(.brown).padding().background(Color.white.cornerRadius(12)).background(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 2))
                        }.padding(.horizontal,10).padding(.top)
                    }
                }.padding().background(Color.white.clipShape(CustomShape())).padding(.top,90)
            }.ignoresSafeArea(.all,edges: .all).background(Image("background_1").resizable().scaledToFill().frame(height: 650).offset(y: -300)).ignoresSafeArea(.all,edges: .all)
        }
    }
}
