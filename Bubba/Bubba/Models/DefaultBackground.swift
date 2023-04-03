//
//  DefaultBackground.swift
//  Bubba
//
//  Created by mccl on 22/03/23.
//

import Foundation
import SwiftUI

struct DefaultBackground: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(maxHeight: .infinity)
            .ignoresSafeArea(.all, edges: .all)
        
    }
}
