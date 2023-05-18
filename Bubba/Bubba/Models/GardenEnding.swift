//
//  GardenEnding.swift
//  Bubba
//
//  Created by mccl on 12/04/23.
//

import SwiftUI

struct GardenEnding: View {
    
    @State private var location: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.7, y: UIScreen.main.bounds.height * 0.4)
    @State var isDragging = false
    
    @Binding var isPresenting: Bool
    
    @Environment(\.dismiss) private var dismiss
    
    @State var shouldAnimate: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                DefaultBackground(imageName: "background garden")
                
                Image("btn close")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.10, height: geometry.size.height * 0.10)
                    .position(x: geometry.size.width * 0.92, y: geometry.size.height * 0.08)
                    .onTapGesture {
                        dismiss()
                    }
                
                VStack {
                    
                    Image("final garden")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.6)
                    
                    Image("bubba")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.4)
                        .position(location)
                        .scaleEffect(shouldAnimate ? 1.07 : 1.05)
                        .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true), value: shouldAnimate)
                        .onAppear() {
                            self.shouldAnimate = true
                            
                        }
                        .gesture(
                            DragGesture().onChanged { value in
                                location = value.location
                                isDragging = true
                            }
                                .onEnded { value in
                                    withAnimation(.spring()) {
                                        isDragging = false
                                        location = CGPoint(x: location.x, y: geometry.size.height * 0.4)
                                    }
                                }
                        )
                    
                    
                }.padding()
                
            }
        }
        
        
    }
}

struct GardenEnding_Previews: PreviewProvider {
    static var previews: some View {
        GardenEnding(isPresenting: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
