//
//  SportView2.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/21.
//

import SwiftUI

struct SportView_paiming: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack
        {
            Image("foodDetailBackground")
                .resizable()
                .scaledToFit()
                .offset(y: -170)
                .zIndex(0)
            VStack {
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                    .offset(x:20,y:-370)
                    Spacer()
                }
            }
            .zIndex(1)
            VStack{
                HStack
                {
                    Spacer()
                    VStack
                    {
                        Text("2")
                            .font(.system(size: 25))
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                        Image("头像2")
                            .resizable()
                            .frame(width: 50 , height: 50)
                            .cornerRadius(25)
                        HStack{
                            
                        }
                        .frame(width: 50 , height: 150)
                        .background(.red)
                    }
                    .padding(.bottom)
                    Spacer()
                    VStack
                    {
                        Text("1")
                            .font(.system(size: 30))
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                        Image("头像1")
                            .resizable()
                            .frame(width: 50 , height: 50)
                            .cornerRadius(25)
                        HStack{
                            
                        }
                        .frame(width: 50 , height: 200)
                        .background(.green)
                    }
                    .padding(.bottom)
                    Spacer()
                    VStack
                    {
                        Text("3")
                            .font(.system(size: 15))
                            .fontWeight(.heavy)
                            .foregroundColor(.red)
                        Image("头像3")
                            .resizable()
                            .frame(width: 50 , height: 50)
                            .cornerRadius(25)
                        HStack{
                            
                        }
                        .frame(width: 50 , height: 100)
                        .background(.yellow)
                    }
                    .padding(.bottom)
                    Spacer()
                }
            }
            .offset(y:-160)
            List{
                ForEach(paimingdata , id: \.self)
                {
                    it in
                    SportPaimingItemView(paiming: it)
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .cornerRadius(50)
            .offset(y:300)
        }.frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
    }
}
