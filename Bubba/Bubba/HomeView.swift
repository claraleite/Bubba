//
//  HomeView.swift
//  Bubba
//
//  Created by mccl on 28/03/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var isPresentingRoomView: Bool = false
    @State var isPresentingGardenView: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
        
        NavigationStack {
            
                ZStack {
                    
                    DefaultBackground(imageName: "Início")
                    
                    VStack {
                        
                        DefaultNavigationButton(icon: Image("Quarto-casa"), nextView: RoomHomeView(), width: geometry.size.width * 0.3, height: geometry.size.height * 0.3)
                        
                    }
                    
                }
            }
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewInterfaceOrientation(.landscapeLeft)
    }
}
