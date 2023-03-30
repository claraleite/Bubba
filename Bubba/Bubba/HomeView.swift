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
        
        NavigationView {
            
            ZStack {
                
                NavigationLink(destination: RoomHomeView(isPresenting: $isPresentingRoomView), isActive: $isPresentingRoomView) {
                    
                    EmptyView()
                    
                }.isDetailLink(false)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                
                DefaultBackground(imageName: "Início")
                
                VStack {
                    Image("Quarto-casa")
                        
                    
                    Text("Quarto da Bubba")
                    

                }.contentShape(Rectangle())
                    .onTapGesture {
                        isPresentingRoomView = true
                    }
                                
                
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().previewInterfaceOrientation(.landscapeLeft)
    }
}
