//
//  DroppableObject.swift
//  Bubba
//
//  Created by mccl on 10/04/23.
//

import SwiftUI

struct DroppableObject: View {
    
    @State var draggedObject: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            if draggedObject != "" {
                DraggingObject(dragObject: draggedObject, width: width, height: height)
            } else {
                Text("Esse não é o lugar da Bubba...")
                    .foregroundColor(.white)
            }
        }
        .frame(width: 280, height: 220)
        .background(Color.gray.opacity(0.25))
        .padding()
        .dropDestination(for: String.self) { items, location in
            
            if items.first == "bubba medo" {
                draggedObject = items.first ?? "bubba medo"
                print(location)
                print(draggedObject)
            }
            
            return true
            
        }
    }
}

struct DroppableObject_Previews: PreviewProvider {
    static var previews: some View {
        DroppableObject(draggedObject: "", width: 200, height: 200)
    }
}
