//
//  Game.swift
//  rgpoop-exercise
//
//  Created by Bruce Burgess on 3/21/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import Foundation


class Game {
    
    var leftPlayer: Character!
    var rightPlayer: Character!
    
    var canAttack = false
    var gameOver = false
    
    init(){
        leftPlayer = Orc(name: "Orc", startingHp: 30, attackPwr: 0)
        rightPlayer = Spartan(name: "Spartan", startingHp: 30, attackPwr: 20)
        gameOver = false
    }
    
    func attacking(side: String) -> String {
        if canAttack {
            if side == "left" {
                let alive = rightPlayer.attemptAttack(leftPlayer.attackPwr)
                canAttack = false
                print("\(rightPlayer.name) : \(rightPlayer.hp)")
                if !alive {
                    gameOver = true
                    return "\(leftPlayer.name) Wins"
                } else {
                    return "\(leftPlayer.name) Attacks \(rightPlayer.name)"
                }
                
            } else if side == "right" {
                let alive = leftPlayer.attemptAttack(rightPlayer.attackPwr)
                canAttack = false
                print("\(leftPlayer.name) : \(leftPlayer.hp)")
                if !alive {
                    gameOver = true
                    return "\(rightPlayer.name) Wins"
                } else {
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
    

    
    
}