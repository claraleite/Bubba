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
    
    @State private var shouldAnimate = false
    
    var shadowName: String
    
    var body: some View {
        
        VStack {
            if draggedObject != "" {
                DraggingObject(dragObject: draggedObject, width: width, height: height)
                    
            } else {
                Image(shadowName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    
                    
                
            }
        }
        .dropDestination(for: String.self) { items, location in
            print(draggedObject)
            
            if items.first == nameOfShadow {
                draggedObject = items.first ?? "walkie"
                self.shouldAnimate = false
                playSound(sound: "muito bem")
            } else {
                playSound(sound: "naonaonao")
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
        DroppableObject(draggedObject: "", width: 100, height: 100, nameOfShadow: "", shadowName: "")
    }
}
