//
//  DraggingObject.swift
//  Bubba
//
//  Created by mccl on 03/04/23.
//

import SwiftUI

struct DraggingObject: View {
    
    var dragObject: String
    var width: CGFloat
    var height: CGFloat
 
    var body: some View {
        ZStack {
            
            Image(dragObject)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
            
 
        }
        .draggable(dragObject)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        DraggingObject(dragObject: "", width: 100, height: 100)
    }
}
