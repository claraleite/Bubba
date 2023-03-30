//
//  DefaultNavigationButton.swift
//  Bubba
//
//  Created by mccl on 30/03/23.
//

import SwiftUI

struct DefaultNavigationButton: View {
    let icon: Image
    let nextView: any View
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        NavigationLink(
            destination: {
                AnyView(nextView)
            }, label: {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
            }
        )
        .isDetailLink(false)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

