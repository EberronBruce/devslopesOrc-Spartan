//
//  Game.swift
//  rgpoop-exercise
//
//  Created by Bruce Burgess on 3/21/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import Foundation
import AVFoundation


class Game {
    
    var attackSound: AVAudioPlayer!
    var deathSound: AVAudioPlayer!
    
    var leftPlayer: Character!
    var rightPlayer: Character!
    
    var canAttack = false
    var gameOver = false
    
    init(leftPlayer: String, rightPlayer: String){
        
        setUpSound()
        
        
        if leftPlayer == "Spartan" {
            self.leftPlayer = Spartan(name: "Left \(leftPlayer)", startingHp: 100, attackPwr: 20)
        } else if leftPlayer == "Orc" {
            self.leftPlayer = Orc(name: "Left \(leftPlayer)", startingHp: 100, attackPwr: 0)
        }
        
        if rightPlayer == "Spartan" {
            self.rightPlayer = Spartan(name: "Right \(rightPlayer)", startingHp: 100, attackPwr: 20)
        } else if rightPlayer == "Orc" {
            self.rightPlayer = Orc(name: "Right \(rightPlayer)", startingHp: 100, attackPwr: 0)
        }

        gameOver = false
    }
    
    func setUpSound() {
        var path = NSBundle.mainBundle().pathForResource("sword", ofType: "wav")
        var soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try attackSound = AVAudioPlayer(contentsOfURL: soundURL)
            attackSound.prepareToPlay()
        } catch let err as NSError {
            print(err.description)
        }
        
        path = NSBundle.mainBundle().pathForResource("death", ofType: "wav")
        soundURL = NSURL(fileURLWithPath: path!)
        
        do {
            try deathSound = AVAudioPlayer(contentsOfURL: soundURL)
            deathSound.prepareToPlay()
        } catch let err as NSError {
            print(err.description)
        }

    }
    
    func attacking(side: String) -> String {
        if canAttack {
            if side == "left" {
                let alive = rightPlayer.attemptAttack(leftPlayer.attackPwr)
                canAttack = false
                print("\(rightPlayer.name) : \(rightPlayer.hp)")
                if !alive {
                    playSound("death")
                    gameOver = true
                    return "\(leftPlayer.name) Wins"
                } else {
                    playSound("attack")
                    return "\(leftPlayer.name) Attacks \(rightPlayer.name)"
                }
                
            } else if side == "right" {
                let alive = leftPlayer.attemptAttack(rightPlayer.attackPwr)
                canAttack = false
                print("\(leftPlayer.name) : \(leftPlayer.hp)")
                if !alive {
                    playSound("death")
                    gameOver = true
                    return "\(rightPlayer.name) Wins"
                } else {
                    playSound("attack")
                    return "\(rightPlayer.name) Attacks \(leftPlayer.name)"
                }
                
            } else {
                return "We have an error, who is attacking"
            }
        }
        
        return "Cannot Attack Now"
    }
    
    func enableAttack() {
        canAttack = true
    }
    

    func playSound(sound: String) {
        if sound == "attack" {
            if attackSound.playing {
                attackSound.stop()
            }
            
            attackSound.play()
        } else if sound == "death" {
            if deathSound.playing {
                deathSound.stop()
            }
            
            deathSound.play()
        }
    }
    
    
}