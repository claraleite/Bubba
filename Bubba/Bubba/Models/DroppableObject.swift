//
//  DroppableObject.swift
//  Bubba
//
//  Created by mccl on 11/04/23.
//

import SwiftUI

struct DroppableObject: View {
    
    @State var draggedObject: String
    var width: CGFloat
    var height: CGFloat
    
    var nameOfShadow: String
    
    var shadowName: String
    
    var body: some View {
        
        VStack {
            if draggedObject != "" {
                DraggingObject(dragObject: draggedObject, width: width, height: height)
            } else {
                Image(shadowName)
                    .frame(width: width, height: height)
            }
        }
        .dropDestination(for: String.self) { items, location in
            print(draggedObject)
            
            if items.first == nameOfShadow {
                draggedObject = items.first ?? "walkie"
            }
            
            print(location)
            
            return true
        } isTargeted: { inDropArea in
            print("In drop area", inDropArea)
            
        }
    }
}

struct DroppableObject_Previews: PreviewProvider {
    static var previews: some View {
        DroppableObject(draggedObject: "", width: 200, height: 200, nameOfShadow: "", shadowName: "")
    }
}
