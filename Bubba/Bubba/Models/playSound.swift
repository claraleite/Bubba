//
//  playSound.swift
//  Bubba
//
//  Created by mccl on 12/04/23.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!

func playSound(sound: String) {
    let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player.setVolume(1.5, fadeDuration: 0.1)
        player?.play()
    } catch {
        print("error")
    }
}
