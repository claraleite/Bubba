//
//  ReusableImage.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 05/04/23.
//

import SwiftUI

struct ReusableImage: View {
    
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 600)
//            .background(Color.white)
    }
}
