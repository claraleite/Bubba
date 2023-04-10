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
                            DefaultBackground(imageName: "home-dividida-01")
                            HomeButton(icon: Image("home-dividida-02"), nextView: RoomHomeView())
                            DefaultBackground(imageName: "home-dividida-03")
                        }
                        
                        HStack(spacing: 0) {
                            DefaultBackground(imageName: "home-dividida-04")
                            DefaultBackground(imageName: "home-dividida-05")
                            HomeButton(icon: Image("home-dividida-06"), nextView: Garden())
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
