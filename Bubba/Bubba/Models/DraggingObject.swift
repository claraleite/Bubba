//
//  DraggingObject.swift
//  Bubba
//
//  Created by mccl on 03/04/23.
//

import SwiftUI

struct DraggingObject: View {
    
    @State var dragAmount = CGSize.zero
    
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
            .offset(dragAmount)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged {
                        self.dragAmount = CGSize(width: $0.translation.width, height: -$0.translation.height)
                    }
                    .onEnded { _ in
                        self.dragAmount = .zero
                    }
            )

    }
}

struct DraggingObject_Previews: PreviewProvider {
    static var previews: some View {
        DraggingObject(imageName: "bubba", width: 120, height: 120)
    }
}
