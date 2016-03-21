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
    
    init(){
        leftPlayer = Orc(name: "Orc", startingHp: 200, attackPwr: 0)
        rightPlayer = Spartan(name: "Spartan", startingHp: 100, attackPwr: 20)
    }
    
    func attacking(side: String) -> String {
        if side == "left" {
            rightPlayer.attemptAttack(leftPlayer.attackPwr)
            checkDeath(rightPlayer)
            print("\(rightPlayer.name) : \(rightPlayer.hp)")
            return "\(leftPlayer.name) Attacks \(rightPlayer.name)"
            
        } else if side == "right" {
            leftPlayer.attemptAttack(rightPlayer.attackPwr)
            checkDeath(leftPlayer)
            print("\(leftPlayer.name) : \(leftPlayer.hp)")
            return "\(rightPlayer.name) Attacks \(leftPlayer.name)"

        } else {
            return "We have an error, who is attacking"
        }
    }
    
    func checkDeath(player: Character){
        if !player.isAlive {
            print("\(player.name) is dead")
        }
    }
    
}