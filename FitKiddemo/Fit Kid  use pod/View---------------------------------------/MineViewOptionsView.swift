//
//  MineViewOptionsView.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/11.
//

import SwiftUI

struct MineViewOptionsView: View {
    var body: some View {
        NavigationView{
            VStack
            {
                ForEach(MineViewOptionViewData , id: \.self)
                {
                    it in
                    Button(action: {
                        
                    }, label: {
                        VStack
                        {
                            HStack
                            {
                                Image(it)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(20)
                                    .frame(width: 40,height: 40)
                                    .padding(.leading , 20)
                                Text("\(it)                                                        > ")
                                
                            }
                            .frame(height: 70)
                            Divider()
                            
                        }
                    })
                    
                }
                Spacer()
            }
        }
    }
}

struct MineViewOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MineViewOptionsView()
    }
}
