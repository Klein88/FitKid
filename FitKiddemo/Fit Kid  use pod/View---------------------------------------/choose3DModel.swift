//
//  choose3DModel.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/10.
//

import SwiftUI
import SceneKit
struct choose3DModel: View {
    
    let griditem : [GridItem] = [GridItem(.flexible()) , GridItem(.flexible())]
    @State var search3DModelText  : String = ""
    @Binding var ischoose : Bool
    @EnvironmentObject var choose3Dmodel : Choose3DModelData
    var body: some View {
        ZStack{
            Color(.white)
            
            VStack
            {
                HStack {
                    Spacer()
                    Button(action: {
                        self.ischoose = false
                    }, label: {
                        Image(systemName: "x.circle")
                            .font(.title)
                            .foregroundColor(.black)
                })
Text("  ")
                }
                .padding(.top,20)
                VStack{
                HStack{
                    Text("   ")
                    Image(systemName: "magnifyingglass")
                    TextField("查询3D模型", text: $search3DModelText)
                }
                    
                
            }
                
                HStack
                {
                    Text("系统模型")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(x: 20)
                        
                    Spacer()
                }
                ScrollView(.vertical)
                {
                    LazyVGrid(columns: griditem)
                    {
                        ForEach(0..<tDModelName.count)
                        {
                            it in
                            SceneModelItemView(modelname: tDModelName[it], ischoose: $ischoose)
                                .scaleEffect(0.5)
                        }
                    }
                }
                HStack
                {
                    Text("我添加的模型")
                        .font(.title2)
                        .fontWeight(.bold)
                        .offset(x: 20)
                        
                    Spacer()
                    
                }
                ScrollView(.vertical)
                {
                    LazyVGrid(columns: griditem)
                    {
                        ForEach(0..<tDModelName_zitianjia.count)
                        {
                            it in
                            SceneModelItemView(modelname: tDModelName_zitianjia[it], ischoose: $ischoose)
                                .scaleEffect(0.5)
                        }
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height * 3 / 4)
        .cornerRadius(40)
        .shadow(radius: 10 , x: 5 , y: 5)
    }
}

struct choose3DModel_Previews: PreviewProvider {
    static var previews: some View {
        choose3DModel(ischoose: .constant(false))
    }
}
