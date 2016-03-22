//
//  Music.swift
//  rgpoop-exercise
//
//  Created by Bruce Burgess on 3/23/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import Foundation
import AVFoundation

class Music {
    static let sharedHelper = Music()
    var audioPlayer: AVAudioPlayer?
    
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("background", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL:aSound)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}
