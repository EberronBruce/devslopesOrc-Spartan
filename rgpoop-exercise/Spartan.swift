//
//  Spartan.swift
//  rgpoop-exercise
//
//  Created by Bruce Burgess on 3/21/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import Foundation

class Spartan: Character {
    
    private var armorPwr = 15
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        let damage = attackPwr - self.armorPwr
        if damage > 0 {
            return super.attemptAttack(damage)
        } else {
            return false
        }
    }
    
    
}