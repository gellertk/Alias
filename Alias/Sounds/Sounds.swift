//
//  Sounds.swift
//  Alias
//
//  Created by Георгий Гречин on 06.05.2022.
//

import Foundation
import AVFoundation


var player = AVAudioPlayer()

func playSound(soundName: String) {
    let url = Bundle.main.url(forResource: soundName, withExtension: ".mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
}
