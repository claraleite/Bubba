//
//  BubbaApp.swift
//  Bubba
//
//  Created by mccl on 22/03/23.
//

import SwiftUI

@main
struct BubbaApp: App {
    
    init() {
        playSoundtrack(sound: "trilha-geral")
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
