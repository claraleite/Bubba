//
//  RoomHomeView.swift
//  Bubba
//
//  Created by mccl on 22/03/23.
//

import SwiftUI

struct RoomHomeView: View {
    var body: some View {
        ZStack {
            
            DefaultBackground(imageName: "Quarto")
            
            Image("Interruptor")
                .offset(x: -180, y: 100)
            
            VStack {
                Image("Quarto-popup")
                    .padding(.all)
                
                Spacer()
            }
        }
    }
}

struct RoomHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RoomHomeView()
            .previewInterfaceOrientation(.landscapeLeft)

    }
}
