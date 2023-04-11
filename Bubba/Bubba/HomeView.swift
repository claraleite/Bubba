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
                                        
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            DefaultBackground(imageName: "casa-02")
                            HomeButton(icon: Image("casa-03"), nextView: RoomHomeView())
                            DefaultBackground(imageName: "casa-04")
                        }
                        
                        HStack(spacing: 0) {
                            DefaultBackground(imageName: "casa-05")
                            DefaultBackground(imageName: "casa-06")
                            HomeButton(icon: Image("casa-07"), nextView: Garden())
                        }
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
