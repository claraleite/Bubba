//
//  ReusableText.swift
//  Bubba
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 05/04/23.
//

import SwiftUI

struct ReusableText: View {
    var text: String
    var size: CGFloat
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundColor(.black)
    }
}

