//
//  HomeButton.swift
//  Bubba
//
//  Created by mccl on 10/04/23.
//

import SwiftUI

struct HomeButton: View {
    let icon: Image
    let nextView: any View
    
    var body: some View {
        NavigationLink(
            destination: {
                AnyView(nextView)
            }, label: {
                icon
                    .resizable()
                    .ignoresSafeArea(.all, edges: .all)

            }
        )
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

