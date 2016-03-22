//
//  Character.swift
//  rgpoop-exercise
//
//  Created by Bruce Burgess on 3/21/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp = 100
    private var _attackPwr = 10
    
    private var _name: String
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }

    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(name: String, startingHp: Int, attackPwr: Int) {
        self._name = name
        self._attackPwr = attackPwr
        self._hp = startingHp
    }
    
    func attemptAttack(attackPwr: Int) ->  Bool {
        self._hp -= attackPwr
        
        if self._hp <= 0 {
            return false
        }
        
        return true
        
    }
    
    
    
}
